-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Des 2024 pada 09.41
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs_tara_cafe`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_arus_kas`
--

CREATE TABLE `tbl_arus_kas` (
  `id` int(13) NOT NULL,
  `kd_transaksi` varchar(30) DEFAULT NULL,
  `tipe` varchar(50) DEFAULT NULL,
  `arus` varchar(10) DEFAULT NULL,
  `total` int(25) DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `operator` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_arus_kas`
--

INSERT INTO `tbl_arus_kas` (`id`, `kd_transaksi`, `tipe`, `arus`, `total`, `waktu`, `operator`) VALUES
(1, 'VPoiw5uAdfnRDst', 'Pembayaran kasir', 'masuk', 26250, '2024-12-02 17:38:47', 'admin'),
(2, 'kp9ckllNa3iJ2Sz', 'Pembayaran kasir', 'masuk', 26250, '2024-12-20 03:20:21', 'admin'),
(3, 'BXWXPNKJAIIVGBO', 'Pembayaran Kasir', 'masuk', 7350, '2024-12-23 08:32:51', ''),
(4, 'BXWXPNKJAIIVGBO', 'Pembayaran Kasir', 'masuk', 7350, '2024-12-23 08:33:44', ''),
(5, '635MOYZHPJ6VETH', 'Pembayaran Kasir', 'masuk', 26250, '2024-12-23 08:38:36', ''),
(6, 'FVAO39KWDUQRNSM', 'Pembayaran Kasir', 'masuk', 26250, '2024-12-23 08:39:15', ''),
(7, 'ORP1CSVGJV2AEW6', 'Pembayaran Kasir', 'masuk', 26250, '2024-12-23 08:42:21', ''),
(8, 'RF2OXYVHDG7GUEW', 'Pembayaran Kasir', 'masuk', 26250, '2024-12-23 08:53:58', ''),
(9, 'GF4DFEGRELCRQ5J', 'Pembayaran Kasir', 'masuk', 26250, '2024-12-23 08:57:34', ''),
(10, 'AZFG2DK9QRF50DZ', 'Pembayaran Kasir', 'masuk', 7350, '2024-12-23 13:22:42', ''),
(11, '2452ELIXO9PRVER', 'Pembayaran Kasir', 'masuk', 26250, '2024-12-23 15:57:01', ''),
(12, '1GMI4R0EUJATT2S', 'Pembayaran Kasir', 'masuk', 26250, '2024-12-24 04:44:50', ''),
(13, 'zGqripBchHfslbr', 'Pembelian bahan baku resto', 'keluar', 10000, '2024-12-24 04:57:51', 'admin'),
(14, 'ata1ukrd2hr2bqJ8Vwf9', 'Pengeluaran resto', 'keluar', 1500000, '2024-12-24 04:58:44', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_bahan_baku`
--

CREATE TABLE `tbl_bahan_baku` (
  `id` int(11) NOT NULL,
  `kd_bahan` varchar(4) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `deks` text NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `stok` int(10) NOT NULL,
  `aktif` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_bahan_baku`
--

INSERT INTO `tbl_bahan_baku` (`id`, `kd_bahan`, `nama`, `deks`, `kategori`, `satuan`, `stok`, `aktif`) VALUES
(1, '4751', 'Mie', 'Untuk Bahan Mie', 'Mie Instan', 'pcs', 4, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_csrf_token`
--

CREATE TABLE `tbl_csrf_token` (
  `id` int(10) NOT NULL,
  `token` varchar(30) DEFAULT NULL,
  `login_from` varchar(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `valid_until` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_delivery_order`
--

CREATE TABLE `tbl_delivery_order` (
  `id` int(5) NOT NULL,
  `kd_pesanan` varchar(15) DEFAULT NULL,
  `pelanggan` varchar(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `alamat_pengiriman` text DEFAULT NULL,
  `masuk` timestamp NOT NULL DEFAULT current_timestamp(),
  `bukti_bayar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_delivery_order`
--

INSERT INTO `tbl_delivery_order` (`id`, `kd_pesanan`, `pelanggan`, `status`, `alamat_pengiriman`, `masuk`, `bukti_bayar`) VALUES
(1, 'MMHIQPVOFBO1DSR', '28581316', 'diproses', 'jl. seth adji no.49, Palangka Raya', '2024-12-22 07:45:11', NULL),
(2, 'VMRTCCUNZWI6PA9', '28581316', 'order_masuk', 'jl. seth adji no.49, Palangka Raya', '2024-12-22 07:50:14', NULL),
(3, 'W6HN1NRIXOTFXJU', '03541856', 'order_masuk', 'zzzzzzzzz', '2024-12-23 02:40:52', NULL),
(4, 'L6Q52UKYTPZJ7E1', '25661603', 'order_masuk', 'zzzzzzzzz', '2024-12-23 02:46:28', NULL),
(5, 'PDQDLW8HFQE10YG', '68364958', 'order_masuk', 'wdwdd', '2024-12-23 03:25:51', 'C:xampphtdocs	ara-cafeengine\noute/../../uploads/bukti_bayar/diagram-export-12-16-2024-10_52_32-PM.png'),
(6, 'AHAO1N8WGTVNJ2I', '84591587', 'order_masuk', 'wdwdd', '2024-12-23 03:27:41', 'Screenshot_6-12-2024_111143_www.canva.com.jpeg'),
(7, 'X704MGEIVNWD7QT', '31074875', 'order_masuk', 'wdwdd', '2024-12-22 03:29:58', 'Picture2.png'),
(8, 'WQXVVVIY0ANNGIZ', '31074875', 'order_masuk', 'wdwdd', '2024-12-23 03:31:49', 'Picture2.png'),
(9, 'DLSY2KWKPEVMIGP', '31074875', 'order_masuk', 'wdwdd', '2024-12-23 03:34:08', 'WhatsApp Image 2024-11-17 at 08.02.44.jpeg'),
(10, 'QBK6NHLYQDAI38O', '37798165', 'order_masuk', 'wdwdd', '2024-12-23 03:40:11', 'Halaman Login.png'),
(11, 'VYT2P5HBFRBW6XH', '86721769', 'order_masuk', 'wdwdd', '2024-12-23 03:48:34', 'WhatsApp Image 2024-12-16 at 15.55.11.jpeg'),
(12, 'DJJLUTX1RMM4VON', '12953544', 'diproses', 'wdwdd', '2024-12-23 03:50:03', 'Lambang_Kota_Palangka_Raya.gif'),
(13, 'JN8UI1AW9FOZCSO', '12953544', 'order_masuk', 'wdwdd', '2024-12-23 03:52:32', 'WhatsApp Image 2024-11-17 at 08.02.44.jpeg'),
(14, 'AZFG2DK9QRF50DZ', '12953544', 'selesai', 'wdwdd', '2024-12-23 03:55:41', 'Struktur Organisasi BTIKP.jpg'),
(15, 'OYI1FURDVKBNOYW', '12953544', 'Dibatalkan', 'wdwdd', '2024-12-23 03:57:46', 'WhatsApp Image 2024-10-28 at 10.04.18.jpeg'),
(26, 'NYC20JBVRJ8AXI2', '28581316', 'order_masuk', 'jl. seth adji no.49, Palangka Raya', '2024-12-23 13:45:30', '6769697ab5cf3_WhatsApp Image 2024-12-17 at 11.04.05.jpeg'),
(27, '2452ELIXO9PRVER', '76684882', 'selesai', 'sacasc', '2024-12-23 13:51:19', '67696ad7664ad_diagram-export-12-16-2024-10_38_43-PM.png'),
(28, '1GMI4R0EUJATT2S', '89532853', 'selesai', 'efef', '2024-12-24 04:42:15', '676a3ba7cd2e4_Lambang_Kota_Palangka_Raya.gif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori_menu`
--

CREATE TABLE `tbl_kategori_menu` (
  `id` int(3) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deks` text NOT NULL,
  `active` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_kategori_menu`
--

INSERT INTO `tbl_kategori_menu` (`id`, `nama`, `deks`, `active`) VALUES
(1, 'Makanan Utama', 'Makanan utama\r\n', '1'),
(2, 'Coffe', 'Coffe & Cappucino\r\n', '1'),
(3, 'Side Food (Snack)', 'Makanan kecil & pendamping', '1'),
(4, 'Cake', 'Kue', '1'),
(5, 'Tea', 'Kategori minuman', '1'),
(6, 'Pasta', 'Pasta', '1'),
(7, 'Juice', 'Kategori jus', '1'),
(8, 'Milkshake', 'Kategori milkshake', '1'),
(9, 'Seafood', 'Seafood', '1'),
(10, 'Noodles', 'Noodles', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_meja`
--

CREATE TABLE `tbl_meja` (
  `id` int(5) NOT NULL,
  `kd_meja` varchar(5) NOT NULL,
  `nama` varchar(111) NOT NULL,
  `deks` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `jlh_tamu` int(3) DEFAULT NULL,
  `last_visit` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_meja`
--

INSERT INTO `tbl_meja` (`id`, `kd_meja`, `nama`, `deks`, `status`, `jlh_tamu`, `last_visit`) VALUES
(1, '1151', 'Meja 1', 'Meja dekat dinding', 'leave', 0, '2024-12-24 08:38:25'),
(2, '2819', 'Meja 2', 'Meja dekat Pintu Masuk', 'leave', 0, '2024-12-24 04:54:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(5) NOT NULL,
  `kd_menu` varchar(10) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `deks` text NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `total_dipesan` int(7) NOT NULL,
  `aktif` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `kd_menu`, `nama`, `deks`, `kategori`, `satuan`, `harga`, `pic`, `total_dipesan`, `aktif`) VALUES
(1, '08128922', 'Nasi Goreng Spesial', 'Nasi goreng spesial dengan tambahan topping sosis, nugget, dan udang', '1', 'porsi', 25000, '08128922.jpg', 2, '1'),
(21, '45446025', 'Tes Manis Dingin', 'Teh manis dingin ukuran sedang', '5', 'porsi', 7000, '45446025.jpg', 37, '1'),
(22, '11834652', 'Ramen', 'Ramen adalah hidangan mi khas Jepang yang disajikan dengan kuah kaldu kaya rasa.', '10', 'porsi', 35000, '11834652.jpg', 0, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mitra`
--

CREATE TABLE `tbl_mitra` (
  `id` int(5) NOT NULL,
  `kd_mitra` varchar(8) NOT NULL,
  `nama` varchar(155) NOT NULL,
  `deks` text NOT NULL,
  `alamat` text NOT NULL,
  `pemilik` varchar(100) NOT NULL,
  `hp` varchar(20) NOT NULL,
  `aktif` varchar(1) NOT NULL,
  `tipe` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_mitra`
--

INSERT INTO `tbl_mitra` (`id`, `kd_mitra`, `nama`, `deks`, `alamat`, `pemilik`, `hp`, `aktif`, `tipe`) VALUES
(1, '35144964', 'CV Es Indonesia', 'Toko Untuk Beli ES', 'jl. seth adji no.49, Palangka Raya', 'Nur Jaya', '0895341640045', '1', 'pemasok');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_operator`
--

CREATE TABLE `tbl_operator` (
  `id` int(5) NOT NULL,
  `username` varchar(55) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `alamat` text NOT NULL,
  `hp` varchar(20) NOT NULL,
  `posisi` varchar(50) NOT NULL,
  `total_waktu_kerja` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id` int(5) NOT NULL,
  `id_pelanggan` varchar(20) NOT NULL,
  `nama` varchar(111) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `last_visit` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id`, `id_pelanggan`, `nama`, `alamat`, `no_hp`, `email`, `last_visit`) VALUES
(1, 'cash', 'Cash (Pelanggan default)', '-', '-', '-', '2020-06-22 09:07:13'),
(2, '28581316', 'Hendri Ansyah', 'jl. seth adji no.49, Palangka Raya', '0895341640045', 'hendriansyah113@gmail.com', '2024-12-22 07:45:11'),
(3, '03541856', 'Fikri', 'zzzzzzzzz', '085252982733', 'hendriansyah113@gmail.com', '2024-12-23 13:38:38'),
(4, '25661603', 'Hendri Ansyah', 'zzzzzzzzz', '085252982722233', 'hendriansyah113@gmail.com', '2024-12-23 02:46:28'),
(5, '68364958', 'Hendri Ansyah', 'wdwdd', '232323', 'hendriansyah113@gmail.com', '2024-12-23 03:25:51'),
(6, '84591587', 'Hendri Ansyah', 'wdwdd', '23232322', 'hendriansyah113@gmail.com', '2024-12-23 03:27:41'),
(7, '31074875', 'Hendri Ansyah', 'wdwdd', '2323232211', 'hendriansyah113@gmail.com', '2024-12-23 03:29:58'),
(8, '37798165', 'Hendri Ansyah', 'wdwdd', '23232322112', 'hendriansyah113@gmail.com', '2024-12-23 03:40:11'),
(9, '86721769', 'Hendri Ansyah', 'wdwdd', '232321322112', 'hendriansyah113@gmail.com', '2024-12-23 03:48:34'),
(10, '12953544', 'Hendri Ansyah', 'wdwdd', '2323213221121', 'hendriansyah113@gmail.com', '2024-12-23 03:50:03'),
(11, '18220107', 'Hendri Ansyah', 'wdwdd', '23232132121121', 'hendriansyah113@gmail.com', '2024-12-23 04:02:31'),
(12, '38794370', 'Hendri Ansyah', 'wdwdd', '232321232121121', 'hendriansyah113@gmail.com', '2024-12-23 04:28:27'),
(13, '66240845', 'fina', 'hjbjbjhbjhb', '00909099', 'hjbbbhhbjhb', '2024-12-23 04:46:36'),
(14, '76675924', 'fina2', 'jl. jati', '085252982733', 'jati@gmail.com', '2024-12-23 05:27:31'),
(15, '76684882', 'budi', 'sacasc', '08973283', 'cacac', '2024-12-23 13:51:19'),
(16, '89532853', 'lina', 'efef', '0828726332', 'ssdfse', '2024-12-24 04:42:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `id` int(7) NOT NULL,
  `kd_invoice` varchar(30) NOT NULL,
  `kd_pesanan` varchar(30) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total` int(25) NOT NULL,
  `kd_promo` varchar(111) DEFAULT NULL,
  `diskon` int(25) NOT NULL,
  `tax` int(15) DEFAULT NULL,
  `total_final` int(25) NOT NULL,
  `tunai` int(25) NOT NULL,
  `kembali` int(25) NOT NULL,
  `operator` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`id`, `kd_invoice`, `kd_pesanan`, `waktu`, `total`, `kd_promo`, `diskon`, `tax`, `total_final`, `tunai`, `kembali`, `operator`) VALUES
(1, '12-03-2024-VPOI', 'VPoiw5uAdfnRDst', '2024-12-02 17:38:47', 25000, '', 0, 1250, 26250, 30000, 3750, 'admin'),
(2, '12-20-2024-KP9C', 'kp9ckllNa3iJ2Sz', '2024-12-20 03:20:21', 25000, '', 0, 1250, 26250, 100000, 73750, 'admin'),
(3, '12-23-2024-BXWX', 'BXWXPNKJAIIVGBO', '2024-12-23 08:32:51', 7000, '', 0, 350, 7350, 7350, 0, ''),
(4, '12-23-2024-BXWX', 'BXWXPNKJAIIVGBO', '2024-12-23 08:33:44', 7000, '', 0, 350, 7350, 7350, 0, ''),
(5, '12-23-2024-635M', '635MOYZHPJ6VETH', '2024-12-23 08:38:36', 25000, '', 0, 1250, 26250, 26250, 0, ''),
(6, '12-23-2024-FVAO', 'FVAO39KWDUQRNSM', '2024-12-23 08:39:15', 25000, '', 0, 1250, 26250, 26250, 0, ''),
(7, '12-23-2024-ORP1', 'ORP1CSVGJV2AEW6', '2024-12-23 08:42:21', 25000, '', 0, 1250, 26250, 26250, 0, ''),
(8, '12-23-2024-RF2O', 'RF2OXYVHDG7GUEW', '2024-12-23 08:53:58', 25000, '', 0, 1250, 26250, 26250, 0, ''),
(9, '12-23-2024-GF4D', 'GF4DFEGRELCRQ5J', '2024-12-23 08:57:34', 25000, '', 0, 1250, 26250, 26250, 0, ''),
(10, '12-23-2024-AZFG', 'AZFG2DK9QRF50DZ', '2024-12-23 13:22:42', 7000, '', 0, 350, 7350, 7350, 0, ''),
(11, '12-23-2024-2452', '2452ELIXO9PRVER', '2024-12-23 15:57:01', 25000, '', 0, 1250, 26250, 26250, 0, ''),
(12, '12-24-2024-1GMI', '1GMI4R0EUJATT2S', '2024-12-24 04:44:50', 25000, '', 0, 1250, 26250, 26250, 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembelian_bahan_baku`
--

CREATE TABLE `tbl_pembelian_bahan_baku` (
  `id` int(10) NOT NULL,
  `kd_pembelian` varchar(15) DEFAULT NULL,
  `mitra` varchar(100) DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total` int(20) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_pembelian_bahan_baku`
--

INSERT INTO `tbl_pembelian_bahan_baku` (`id`, `kd_pembelian`, `mitra`, `waktu`, `total`, `operator`) VALUES
(1, 'zGqripBchHfslbr', '35144964', '2024-12-24 04:57:51', 10000, 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengeluaran`
--

CREATE TABLE `tbl_pengeluaran` (
  `id` int(9) NOT NULL,
  `kd_pengeluaran` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deks` text DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `total` int(20) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_pengeluaran`
--

INSERT INTO `tbl_pengeluaran` (`id`, `kd_pengeluaran`, `nama`, `deks`, `kategori`, `total`, `operator`, `waktu`) VALUES
(1, 'ata1ukrd2hr2bqJ8Vwf9', 'Gajih', 'Gajih Sari', 'gaji pegawai', 1500000, 'admin', '2024-12-24 04:58:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pesanan`
--

CREATE TABLE `tbl_pesanan` (
  `id` int(7) NOT NULL,
  `kd_pesanan` varchar(20) NOT NULL,
  `pelanggan` varchar(111) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `jumlah_tamu` int(3) NOT NULL,
  `meja` varchar(111) DEFAULT NULL,
  `waktu_masuk` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `waktu_selesai` timestamp NOT NULL DEFAULT current_timestamp(),
  `operator` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_pesanan`
--

INSERT INTO `tbl_pesanan` (`id`, `kd_pesanan`, `pelanggan`, `tipe`, `jumlah_tamu`, `meja`, `waktu_masuk`, `waktu_selesai`, `operator`, `status`) VALUES
(1, 'VPoiw5uAdfnRDst', 'cash', 'dine_in', 1, '1151', '2024-12-02 17:38:47', '2024-12-02 17:38:47', 'admin', 'done'),
(6, 'kp9ckllNa3iJ2Sz', '28581316', 'dine_in', 2, '1151', '2024-12-23 17:08:07', '2024-12-20 03:20:21', 'admin', 'done');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_promo`
--

CREATE TABLE `tbl_promo` (
  `id` int(4) NOT NULL,
  `kd_promo` varchar(8) NOT NULL,
  `nama` varchar(111) NOT NULL,
  `deks` text NOT NULL,
  `tipe` varchar(25) NOT NULL,
  `value` int(20) NOT NULL,
  `kuota` int(5) NOT NULL,
  `tanggal_expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_promo`
--

INSERT INTO `tbl_promo` (`id`, `kd_promo`, `nama`, `deks`, `tipe`, `value`, `kuota`, `tanggal_expired`) VALUES
(1, '370008', 'Jumat Berkah', 'Beli pada hari jumat diskon 30%', 'persen', 30, 2, '2024-12-31'),
(2, '864826', 'khusus malam', 'malam', 'total_harga', 10000, 2, '2024-12-27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `id` int(3) NOT NULL,
  `kd_setting` varchar(200) NOT NULL,
  `caption` varchar(111) NOT NULL,
  `deks` text NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_setting`
--

INSERT INTO `tbl_setting` (`id`, `kd_setting`, `caption`, `deks`, `value`) VALUES
(1, 'tax', 'Pajak restoran', 'Tambahann pajak ketika pembayaran', '10'),
(2, 'nama_resto', 'Nama restoran', 'Nama Restoran', 'Tara Cafe'),
(5, 'alamat_resto', 'Alamat restoran', '', 'Jln. G Obos, No. 49, Kec. Jekan Raya, Kota Palangka Raya, Kalimantan Tengah 74111'),
(6, 'status_setting', 'Status Setting', '-', 'done'),
(7, 'nama_owner', 'Nama Owner Resto', '', 'SAFINA NURHIDAYANTI'),
(9, 'logo_resto', 'Logo Restoran', '', 'logo.jpg'),
(10, 'awal_pembukuan', 'Tahun awal pembukuan', '', '2020'),
(12, 'saldo_awal', 'Saldo awal resto', '', '1000000'),
(13, 'nomor_handphone', 'Nomor Handphone Restoran', '', '082272177099'),
(18, 'kode_pos', 'Kode Pos Resto', '', '20986');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_temp_pembelian_bahan_baku`
--

CREATE TABLE `tbl_temp_pembelian_bahan_baku` (
  `id` int(10) NOT NULL,
  `kd_temp` varchar(20) DEFAULT NULL,
  `kd_pembelian` varchar(15) DEFAULT NULL,
  `kd_item` varchar(15) DEFAULT NULL,
  `qt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_temp_pembelian_bahan_baku`
--

INSERT INTO `tbl_temp_pembelian_bahan_baku` (`id`, `kd_temp`, `kd_pembelian`, `kd_item`, `qt`) VALUES
(1, 'u3ZntzYOgkwxF7sAd2D5', 'zGqripBchHfslbr', '4751', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_temp_pesanan`
--

CREATE TABLE `tbl_temp_pesanan` (
  `id` int(7) NOT NULL,
  `id_temp` varchar(55) NOT NULL,
  `kd_pesanan` varchar(20) NOT NULL,
  `kd_menu` varchar(11) NOT NULL,
  `harga_at` int(20) NOT NULL,
  `qt` int(4) NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_temp_pesanan`
--

INSERT INTO `tbl_temp_pesanan` (`id`, `id_temp`, `kd_pesanan`, `kd_menu`, `harga_at`, `qt`, `total`) VALUES
(1, 'yzjl1g8EW7dVSTP0GxhQ', 'VPoiw5uAdfnRDst', '08128922', 25000, 1, 25000),
(6, 'ikvgtdQqMqJK17yIDTE6', 'kp9ckllNa3iJ2Sz', '08128922', 25000, 1, 25000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_temp_self_service`
--

CREATE TABLE `tbl_temp_self_service` (
  `id` int(10) NOT NULL,
  `kd_temp` varchar(15) DEFAULT NULL,
  `kd_item` varchar(10) DEFAULT NULL,
  `qt` int(3) DEFAULT NULL,
  `harga_at` int(20) DEFAULT NULL,
  `total` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_temp_self_service`
--

INSERT INTO `tbl_temp_self_service` (`id`, `kd_temp`, `kd_item`, `qt`, `harga_at`, `total`) VALUES
(1, 'F7PBMW5LZJNCCDC', '08128922', 1, 25000, 25000),
(2, 'F7PBMW5LZJNCCDC', '45446025', 1, 7000, 7000),
(3, '6BQZATCM7OLLXWY', '08128922', 1, 25000, 25000),
(4, 'ONWRKVZYRHF2NVG', '45446025', 1, 7000, 7000),
(5, '48UTY3BWKD7ST6K', '08128922', 1, 25000, 25000),
(6, 'DDITM8XUBFLYW8R', '08128922', 1, 25000, 25000),
(7, 'EM5MYHU8SE1NJXU', '08128922', 1, 25000, 25000),
(8, 'DUJG6F1SYADLHIA', '08128922', 1, 25000, 25000),
(9, 'ZAK5DNNJ19H7MG2', '08128922', 1, 25000, 25000),
(10, 'G5VM4HKDY9ORO4V', '08128922', 1, 25000, 25000),
(11, 'G5VM4HKDY9ORO4V', '45446025', 1, 7000, 7000),
(12, 'DJW23HC5QORT9H3', '08128922', 1, 25000, 25000),
(13, 'MMHIQPVOFBO1DSR', '08128922', 1, 25000, 25000),
(14, 'VMRTCCUNZWI6PA9', '08128922', 1, 25000, 25000),
(15, 'PU156U7TBQGK6JF', '08128922', 1, 25000, 25000),
(16, 'W6HN1NRIXOTFXJU', '45446025', 1, 7000, 7000),
(17, 'L6Q52UKYTPZJ7E1', '08128922', 1, 25000, 25000),
(18, 'NQVWTKWQG4SV4SC', '45446025', 1, 7000, 7000),
(19, 'PDQDLW8HFQE10YG', '45446025', 1, 7000, 7000),
(20, 'AHAO1N8WGTVNJ2I', '45446025', 1, 7000, 7000),
(21, 'X704MGEIVNWD7QT', '45446025', 1, 7000, 7000),
(22, 'WQXVVVIY0ANNGIZ', '45446025', 1, 7000, 7000),
(23, 'DLSY2KWKPEVMIGP', '45446025', 1, 7000, 7000),
(24, 'QBK6NHLYQDAI38O', '45446025', 1, 7000, 7000),
(25, 'VYT2P5HBFRBW6XH', '45446025', 1, 7000, 7000),
(26, 'DJJLUTX1RMM4VON', '45446025', 1, 7000, 7000),
(27, 'JN8UI1AW9FOZCSO', '45446025', 1, 7000, 7000),
(28, 'AZFG2DK9QRF50DZ', '45446025', 1, 7000, 7000),
(34, '8W14URXGOXNJH4L', '08128922', 1, 25000, 25000),
(41, 'NYC20JBVRJ8AXI2', '45446025', 1, 7000, 7000),
(42, 'NTD5ZG8CQWPZIL0', '08128922', 1, 25000, 25000),
(43, '2452ELIXO9PRVER', '08128922', 1, 25000, 25000),
(44, '1GMI4R0EUJATT2S', '08128922', 1, 25000, 25000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` int(5) NOT NULL,
  `token_transaksi` varchar(25) NOT NULL,
  `kd_transaksi` varchar(15) NOT NULL,
  `arus` varchar(10) NOT NULL,
  `total` int(20) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `operator` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id`, `token_transaksi`, `kd_transaksi`, `arus`, `total`, `waktu`, `operator`) VALUES
(1, 'zj8gYxq2zsQ7obMj5Dl1FBovp', 'VPoiw5uAdfnRDst', 'masuk', 26250, '2024-12-02 17:38:47', 'admin'),
(2, 'ot7EzrfZL2hA27cCpX85lnRxP', 'kp9ckllNa3iJ2Sz', 'masuk', 26250, '2024-12-20 03:20:21', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(5) NOT NULL,
  `username` varchar(111) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `password` varchar(111) NOT NULL,
  `tipe` varchar(11) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `nama`, `password`, `tipe`, `last_login`) VALUES
(1, 'admin', 'Safina Nurhidayanti', '$2y$10$BcD2s9XpSC9lqMXdD17Qw.cDyBms9JUZ36XcEDVKUl3lmOivSGYFe', 'admin', '2024-12-24 08:39:09'),
(2, 'kasir', 'kasir', '$2y$10$YcnV/mudgmKt5UhMcLWrBesOOg4TqpOrTnEqPouBQeas8rDx9MEF2', 'kasir', '2024-12-24 08:37:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_arus_kas`
--
ALTER TABLE `tbl_arus_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_bahan_baku`
--
ALTER TABLE `tbl_bahan_baku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_delivery_order`
--
ALTER TABLE `tbl_delivery_order`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_kategori_menu`
--
ALTER TABLE `tbl_kategori_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_meja`
--
ALTER TABLE `tbl_meja`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_mitra`
--
ALTER TABLE `tbl_mitra`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_operator`
--
ALTER TABLE `tbl_operator`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pembelian_bahan_baku`
--
ALTER TABLE `tbl_pembelian_bahan_baku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pengeluaran`
--
ALTER TABLE `tbl_pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_promo`
--
ALTER TABLE `tbl_promo`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_temp_pembelian_bahan_baku`
--
ALTER TABLE `tbl_temp_pembelian_bahan_baku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_temp_pesanan`
--
ALTER TABLE `tbl_temp_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_temp_self_service`
--
ALTER TABLE `tbl_temp_self_service`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`,`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_arus_kas`
--
ALTER TABLE `tbl_arus_kas`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tbl_bahan_baku`
--
ALTER TABLE `tbl_bahan_baku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_delivery_order`
--
ALTER TABLE `tbl_delivery_order`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori_menu`
--
ALTER TABLE `tbl_kategori_menu`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbl_meja`
--
ALTER TABLE `tbl_meja`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tbl_mitra`
--
ALTER TABLE `tbl_mitra`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_operator`
--
ALTER TABLE `tbl_operator`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_pembelian_bahan_baku`
--
ALTER TABLE `tbl_pembelian_bahan_baku`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengeluaran`
--
ALTER TABLE `tbl_pengeluaran`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_promo`
--
ALTER TABLE `tbl_promo`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tbl_temp_pembelian_bahan_baku`
--
ALTER TABLE `tbl_temp_pembelian_bahan_baku`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_temp_pesanan`
--
ALTER TABLE `tbl_temp_pesanan`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_temp_self_service`
--
ALTER TABLE `tbl_temp_self_service`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
