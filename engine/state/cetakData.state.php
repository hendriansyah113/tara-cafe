<?php

class cetakData
{

    private $st;

    public function __construct()
    {
        $this->st = new state;
    }

    public function getPembelianBb($kdPembelian)
    {
        $this->st->query("SELECT * FROM tbl_pembelian_bahan_baku WHERE kd_pembelian='$kdPembelian';");
        return $this->st->querySingle();
    }

    public function getNamaMitra($kdMitra)
    {
        $this->st->query("SELECT nama FROM tbl_mitra WHERE kd_mitra='$kdMitra';");
        $q = $this->st->querySingle();
        return $q['nama'];
    }

    public function getSetting($kdSetting)
    {
        $this->st->query("SELECT value FROM tbl_setting WHERE kd_setting='$kdSetting';");
        $q = $this->st->querySingle();
        return $q['value'];
    }

    public function getDataTemp($kdPembelian)
    {
        $this->st->query("SELECT * FROM tbl_temp_pembelian_bahan_baku WHERE kd_pembelian='$kdPembelian';");
        return $this->st->queryAll();
    }

    public function getBahanData($kdBahan)
    {
        $this->st->query("SELECT * FROM tbl_bahan_baku WHERE kd_bahan='$kdBahan';");
        return $this->st->querySingle();
    }

    public function getItemPesanan($kdPesanan)
    {
        $this->st->query("SELECT * FROM tbl_pesanan WHERE kd_pesanan='$kdPesanan';");
        return $this->st->querySingle();
    }

    public function getNamaPelanggan($kdPelanggan)
    {
        $this->st->query("SELECT * FROM tbl_pelanggan WHERE id_pelanggan='$kdPelanggan';");
        return $this->st->querySingle();
    }

    public function getItemPesanankode($kdBahan)
    {
        $this->st->query("SELECT * FROM tbl_menu WHERE kd_menu='$kdBahan';");
        $q = $this->st->querySingle();
    }

    public function getDataPengeluaran($kdTransaksi)
    {
        $this->st->query("SELECT * FROM tbl_pengeluaran WHERE kd_pengeluaran='$kdTransaksi';");
        return $this->st->querySingle();
    }

    // buatkan getpembayaran
    public function getPembayaran($kdPembayaran)
    {
        $this->st->query("SELECT p.kd_pesanan AS kd_pembayaran, p.total_final, p.waktu, t.kd_menu, t.qt AS jumlah, m.nama, m.harga 
                          FROM tbl_pembayaran p 
                          JOIN tbl_temp_pesanan t ON p.kd_pesanan = t.kd_pesanan 
                          JOIN tbl_menu m ON t.kd_menu = m.kd_menu 
                          WHERE p.kd_pesanan = '$kdPembayaran';");
        return $this->st->queryAll(); // Kembalikan semua baris data
    }


    public function getDataTempMenu($kdMenu)
    {
        $this->st->query("SELECT * FROM tbl_temp_pesanan WHERE kd_pesanan='$kdMenu';");
        return $this->st->querySingle();
    }
}
