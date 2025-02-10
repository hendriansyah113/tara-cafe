<?php

class deliveryOrder extends Route
{

    private $sn = 'deliveryOrderData';
    private $su = 'utilityData';

    public function index()
    {
        $this->bind('dasbor/deliveryOrder/deliveryOrder');
    }

    public function getDataDeliveryOrder()
    {
        $this->state($this->su)->csrfCek();
        $requestData = $_REQUEST;

        // Total semua pesanan
        $totalPesanan = $this->state($this->sn)->getJlhPesanan();

        // Total data setelah filtering
        $searchValue = $requestData['search']['value'];
        $totalFiltered = $this->state($this->sn)->getFilteredPesanan($searchValue);

        // Data pesanan
        $dataPesanan = $this->state($this->sn)->getDataPesanan($requestData);

        $data = array();
        $no = $requestData['start'] + 1;

        foreach ($dataPesanan as $ds) {
            $kdPesanan = $ds['kd_pesanan'];
            $kurir = $ds['kurir'];
            $namaPelanggan = $ds['nama'];
            $hp = $ds['no_hp'];

            if ($kurir === '') {
                $kurirCap = '-';
            } else {
                $kurirCap = $kurir;
            }
            $status = $ds['status'];
            if ($status === 'order_masuk') {
                $statusCap = 'Pesanan Masuk'; // Set status caption for 'order_masuk'
                $waMessage = "Halo " . urlencode($namaPelanggan) . ", pesanan anda dengan kode " . $kdPesanan . " telah kami terima."; // Message for received order
            } else if ($status === 'diproses') {
                $statusCap = 'Orderan di proses'; // Set status caption for 'diproses'
                $waMessage = "Halo " . urlencode($namaPelanggan) . ", pesanan anda dengan kode " . $kdPesanan . " sedang kami proses."; // Message for order being processed
            } else if ($status === 'selesai') {
                $statusCap = 'Orderan selesai'; // Set status caption for 'selesai'
                $waMessage = "Halo " . urlencode($namaPelanggan) . ", pesanan anda dengan kode " . $kdPesanan . " telah selesai."; // Message for completed order
            } else {
                $statusCap = 'Dibatalkan'; // Set status caption for any other status (canceled)
                $waMessage = "Halo " . urlencode($namaPelanggan) . ", pesanan anda dengan kode " . $kdPesanan . " telah dibatalkan."; // Message for canceled order
            }

            $total = $this->state($this->sn)->getTotalPesanan($kdPesanan);
            $nestedData = array();
            $nestedData[] = $no++;
            $nestedData[] = $kdPesanan;
            $nestedData[] = $namaPelanggan;
            $nestedData[] = $statusCap;
            $nestedData[] = $ds['masuk'];
            $nestedData[] = "Rp. " . number_format($total);
            // Check if bukti bayar exists and create a link
            if (!empty($ds['bukti_bayar'])) {
                $buktiBayarUrl = 'uploads/bukti_bayar/' . $ds['bukti_bayar'];
                $nestedData[] = "<a href='$buktiBayarUrl' target='_blank'>Lihat Bukti</a>";
            } else {
                $nestedData[] = 'Tidak ada bukti';
            }
            $nestedData[] = "<a href='#!' class='btn btn-primary btn-sm btn-icon icon-left btnDetail' data-id='" . $kdPesanan . "'><i class='fas fa-info-circle'></i> Detail</a>";
            $nestedData[] = "<a href='https://wa.me/" . $hp . "?text=" . $waMessage . "' class='btn btn-success btn-sm btn-icon icon-left' target='_blank'><i class='fab fa-whatsapp'></i> WhatsApp</a>";
            $data[] = $nestedData;
        }

        $json_data = array(
            "draw"            => intval($requestData['draw']),
            "recordsTotal"    => intval($totalPesanan),
            "recordsFiltered" => intval($totalPesanan),
            "data"            => $data
        );

        $this->toJson($json_data);
    }

    public function detailPesanan($kdPesanan)
    {
        $this->state($this->su)->csrfCek();
        $data['kdPesanan'] = $kdPesanan;
        $pesanan = $this->state($this->sn)->detailPesanan($kdPesanan);
        $kurir = $this->state($this->sn)->getKurir();
        $status = $pesanan['status'];

        if ($status === 'order_masuk') {
            $statusCap = 'Pesanan Masuk';
        } else if ($status === 'diproses') {
            $statusCap = 'Orderan di proses';
        } else if ($status === 'selesai') {
            $statusCap = 'Orderan selesai';
        } else {
            $statusCap = 'Dibatalkan';
        }

        $totalHarga = $this->state('homeData')->getTotalPesanan($kdPesanan);
        $tax = $this->state($this->su)->getSettingResto('tax');
        $taxPrice = ($totalHarga * $tax) / 100;
        $totalFinal = $totalHarga + $taxPrice;
        $data['statusCap'] = $statusCap;
        $data['status'] = $status;
        $data['kurir'] = $kurir;
        $data['waktu_order'] = $pesanan['masuk'];
        $data['namaPelanggan'] = $this->state($this->su)->getNamaPelanggan($pesanan['pelanggan']);
        $data['alamatPengiriman'] = $pesanan['alamat_pengiriman'];
        $data['itemPesanan'] = $this->state($this->sn)->getItemPesanan($kdPesanan);
        $data['tax'] = $tax;
        $data['taxPrice'] = $taxPrice;
        $data['totalHarga'] = $totalHarga;
        $data['totalFinal'] = $totalFinal;
        $this->bind('dasbor/deliveryOrder/detailPesanan', $data);
    }

    public function prosesPesanan()
    {
        $this->state($this->su)->csrfCek();
        $kdPesanan = $this->inp('kdPesanan');
        $this->state($this->sn)->prosesPesanan($kdPesanan);
        $data['status'] = 'sukses';
        $this->toJson($data);
    }

    public function kirimPesanan()
    {
        $this->state($this->su)->csrfCek();
        $kdPesanan = $this->inp('kdPesanan');
        $kurir = $this->inp('kurir');
        $waktu = $this->waktu();
        $this->state($this->sn)->kirimPesanan($kurir, $waktu, $kdPesanan);
        // Kirim email notifikasi 
        $namaResto = $this->state($this->su)->getSettingResto('nama_resto');
        $emailHost = $this->state($this->su)->getSettingResto('email_host');
        $passwordHost = $this->state($this->su)->getSettingResto('email_host_password');
        $detailPesanan = $this->state($this->sn)->detailPesanan($kdPesanan);
        $detailPelanggan = $this->state($this->sn)->getDetailPelanggan($detailPesanan['pelanggan']);
        $namaPelanggan = $detailPelanggan['nama'];
        $penerima = $detailPelanggan['email'];
        $judul = "Pesanan Sedang Dikirim - " . $namaResto;
        $link = "90122-" . $kdPesanan . "-NRST-ADNRS-SPELLBEE";
        $isi = "Halo " . $namaPelanggan . ", terima kasih telah melakukan pemesanan di resto kami. <br/>";
        $isi .= "Pesanan anda telah dikirim, pastikan telepon anda aktif agar kurir dapat menghubungi anda. Cek detail pesanan anda di ";
        $isi .= "<a href='" . HOMEBASE . "home/pesanan/" . $link . "'>sini</a><br/><br/><br/>Salam<br/>" . $namaResto;
        $this->kirimEmail($namaPelanggan, $penerima, $judul, $isi, $emailHost, $passwordHost);
        $data['status'] = 'sukses';
        $this->toJson($data);
    }

    public function setSelesai()
    {
        $this->state($this->su)->csrfCek();
        $kdPesanan = $this->inp('kdPesanan');
        $waktu = $this->waktu();
        // Save ke pembayaran 
        $kdInvoice = date('m') . "-" . date('d') . "-" . date('Y') . "-" . substr($kdPesanan, 0, 4);
        $totalHarga = $this->state('homeData')->getTotalPesanan($kdPesanan);
        $tax = $this->state($this->su)->getSettingResto('tax');
        $taxPrice = ($totalHarga * $tax) / 100;
        $totalFinal = $totalHarga + $taxPrice;
        $operator = $this->getses('userSes');
        $this->state($this->sn)->savePembayaran($kdInvoice, $kdPesanan, $waktu, $totalHarga, $taxPrice, $totalFinal, $operator);
        // Save arus kas 
        $this->state($this->sn)->saveArusKas($kdPesanan, $totalFinal, $waktu, $operator);
        // Kirim email notifikasi 
        $namaResto = $this->state($this->su)->getSettingResto('nama_resto');
        $emailHost = $this->state($this->su)->getSettingResto('email_host');
        $passwordHost = $this->state($this->su)->getSettingResto('email_host_password');
        $detailPesanan = $this->state($this->sn)->detailPesanan($kdPesanan);
        $detailPelanggan = $this->state($this->sn)->getDetailPelanggan($detailPesanan['pelanggan']);

        $namaPelanggan = $detailPelanggan['nama'];
        $penerima = $detailPelanggan['email'];
        $judul = "Pesanan Selesai - " . $namaResto;
        $link = "90122-" . $kdPesanan . "-NRST-ADNRS-SPELLBEE";
        $isi = "Halo " . $namaPelanggan . ", terima kasih telah melakukan pemesanan di resto kami. <br/>";
        $isi .= "Pesanan anda telah selesai, cek detail pesanan anda di ";
        $isi .= "<a href='" . HOMEBASE . "home/pesanan/" . $link . "'>sini</a><br/><br/><br/>Salam<br/>" . $namaResto;
        $this->kirimEmail($namaPelanggan, $penerima, $judul, $isi, $emailHost, $passwordHost);
        // Set selesai 
        $this->state($this->sn)->setSelesai($waktu, $kdPesanan);
        // Send notifkasi whatsapp 
        $key = $this->state($this->su)->getSettingResto('api_woo_wa');
        $hp = $detailPelanggan['no_hp'];
        $message = "Pesanan anda telah selesai. Kode pesanan : " . $kdPesanan . " - Terima kasih telah melakukan transaksi di resto kami. Salam -" . $namaResto;
        $this->sendWaNotif($key, $hp, $message);
        $data['status'] = 'sukses';
        $this->toJson($data);
    }

    public function batalkanPesanan()
    {
        $this->state($this->su)->csrfCek();
        $kdPesanan = $this->inp('kdPesanan');
        $this->state($this->sn)->hapusTemp($kdPesanan);
        $this->state($this->sn)->hapusPesanan($kdPesanan);
        $data['status'] = 'sukses';
        $this->toJson($data);
    }

    public function getPesananTerbaru()
    {
        $this->state($this->su)->csrfCek();
        $data['pesanan'] = $this->state($this->sn)->getPesananTerbaru();
        $this->toJson($data);
    }

    public function batalkanPesananTakeaway()
    {
        $this->state($this->su)->csrfCek();
        $kdPesanan = $this->inp('kdPesanan');

        // Batalkan pesanan
        $this->state($this->sn)->batalkanPesananTakeaway($kdPesanan);

        header('Content-Type: application/json');
        echo json_encode(['status' => 'success', 'message' => 'Pesanan takeaway berhasil dibatalkan']);
        exit;
    }
}
