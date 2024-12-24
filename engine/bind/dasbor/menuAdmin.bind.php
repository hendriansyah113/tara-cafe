<ul class="sidebar-menu" style='margin-top:20px;'>
    <li><a class="nav-link btnDashboard" href="#!" @click='berandaAct'><i
                class="fas fa-home"></i><span>Dashboard</span></a></li>
    <li><a class="nav-link btnKartuLaundry" href="#!" @click='monitoringAtc'><i
                class="far fa-newspaper"></i><span>Monitoring Cafe</span></a></li>
    <li><a class="nav-link btnLaundryRoom" href="#!" @click='pesananBaruAtc'><i
                class="fas fa-concierge-bell"></i><span>Pesanan Baru</span></a></li>
    <li><a class="nav-link btnKartuLaundry" href="#!" @click='pesananAtc'><i class="fas fa-clipboard"></i><span>Pesanan
                Cafe</span></a></li>
    <li><a class="nav-link btnKartuLaundry" href="#!" @click='deliveryOrderAtc'><i
                class='fas fa-shipping-fast'></i><span>Take Away</span></a></li>
    <li class="dropdown">
        <a href="#!" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-newspaper"></i> <span>Data
                Master</span></a>
        <ul class="dropdown-menu">
            <li><a class="nav-link" href="#!" @click='menuAtc'>Menu</a></li>
            <li><a class="nav-link" href="#!" @click='pelangganAtc'>Pelanggan</a></li>
            <li><a class="nav-link" href="#!" @click='bahanBakuAtc'>Bahan Baku</a></li>
            <li><a class="nav-link" href="#!" @click='mejaAtc'>Meja</a></li>
            <li><a class="nav-link" href="#!" @click='promoAtc'>Promo</a></li>
            <li><a class="nav-link" href="#!" @click='mitraAtc'>Mitra</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#!" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-file-export"></i>
            <span>Pengeluaran</span></a>
        <ul class="dropdown-menu">
            <li><a class="nav-link" href="#!" @click='pembelianBahanBakuAtc'>Pembelian Bahan Baku</a></li>
            <li><a class="nav-link" href="#!" @click='pengeluaranAtc'>Pengeluaran Cafe</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#!" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-chart-line"></i>
            <span>Laporan & Statistik</span></a>
        <ul class="dropdown-menu">
            <li><a class="nav-link" href="#!" @click='arusKasAtc'>Arus Kas</a></li>
            <li><a class="nav-link" href="#!" @click='laporanTransaksiAtc'>Laporan Transaksi</a></li>
            <li><a class="nav-link" href="#!" @click='statistikAtc'>Statistik Cafe</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#!" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-cogs"></i> <span>Setting
                Cafe</span></a>
        <ul class="dropdown-menu">
            <li><a class="nav-link" href="#!" @click='pengaturanUmumAtc'>Pengaturan Umum</a></li>
            <li><a class="nav-link" href="#!" @click='manajemenUserAtc'>Manajemen User</a></li>
        </ul>
    </li>
    <li><a class="nav-link" id='btnLogOut' href="<?= HOMEBASE; ?>dasbor/logOut"><i class="fas fa-sign-out-alt"></i>
            <span>LogOut</span></a></li>
</ul>