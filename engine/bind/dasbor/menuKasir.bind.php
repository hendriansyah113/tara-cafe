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
                class='fas fa-shipping-fast'></i><span>Takeaway</span></a></li>
    <li><a class="nav-link" id='btnLogOut' href="<?= HOMEBASE; ?>dasbor/logOut"><i class="fas fa-sign-out-alt"></i>
            <span>LogOut</span></a></li>
</ul>