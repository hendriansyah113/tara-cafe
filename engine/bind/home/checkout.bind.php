<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Meta -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Title -->
    <title>Checkout Takeaway - <?= $data['namaResto']; ?></title>

    <!-- Favicons -->
    <link rel="shortcut icon" href="assets/img/favicon.png">
    <link rel="apple-touch-icon" href="assets/img/favicon_60x60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/favicon_76x76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="assets/img/favicon_120x120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="assets/img/favicon_152x152.png">

    <!-- Fonts -->
    <link
        href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Raleway:wght@100;200;400;500&display=swap"
        rel="stylesheet">
    <!-- CSS Core -->
    <link rel="stylesheet" href="<?= HOMEBASE; ?>ladun/home/dist/css/core.css" />
    <!-- CSS Theme -->
    <link id="theme" rel="stylesheet" href="<?= HOMEBASE; ?>ladun/home/dist/css/theme-beige.css" />
    <!-- Vue JS -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Socket IO -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.dev.js'></script>
</head>

<body>

    <!-- Body Wrapper -->
    <div id="body-wrapper" class="animsition">

        <!-- Header -->
        <header id="header" class="light">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <!-- Logo -->
                        <div class="module module-logo dark">
                            <a href="<?= HOMEBASE; ?>home">
                                <img src="<?= HOMEBASE; ?>ladun/logo.jpg" alt="" style="width: 200px;">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="module right">
                            <a href="<?= HOMEBASE; ?>login" class="btn btn-outline-secondary"><span>Login</span></a>
                        </div>
                    </div>

                </div>
            </div>
        </header>
        <!-- Header / End -->

        <!-- Content -->
        <div id="content">

            <!-- Page Title -->
            <div class="page-title bg-dark dark">
                <!-- BG Image -->
                <div class="bg-image bg-parallax"><img src="http://assets.suelo.pl/soup/img/photos/bg-croissant.jpg"
                        alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-4">
                            <h1 class="mb-0">Checkout Takeaway</h1>
                            <h4 class="text-muted mb-0">Silahkan isi data pemesanan anda</h4>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Section -->
            <section class="section bg-light">

                <div class="container" id='divCart'>
                    <div class="row">
                        <div class="col-xl-4 col-lg-5">
                            <div class="cart-details shadow bg-white stick-to-content mb-4">
                                <div class="bg-dark dark p-4">
                                    <h5 class="mb-0">You order</h5>
                                </div>
                                <table class="table">
                                    <tr>
                                        <th>Item</th>
                                        <th>Total</th>
                                    </tr>
                                    <?php foreach ($data['itemPesanan'] as $it): ?>
                                        <tr>
                                            <td style="text-align: left;padding-left:12px;">
                                                <span><a href="#!"><?= $it['namaMenu']; ?></a></span><br />
                                                (@) Rp. <?= number_format($it['hargaAt']); ?> x <?= $it['qt']; ?>
                                            </td>
                                            <td>Rp. <?= number_format($it['total']); ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                    <tr>
                                        <th>Total</th>
                                        <th>Rp. <?= number_format($data['totalHarga']); ?></th>
                                    </tr>
                                    <tr>
                                        <th>Tax (<?= $data['tax']; ?>%)</th>
                                        <th>Rp. <?= number_format($data['taxCharge']); ?></th>
                                    </tr>
                                    <tr>
                                        <th>Total Final</th>
                                        <th>Rp. <?= number_format($data['hargaAfterTax']); ?></th>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-7 order-lg-first">
                            <div class="bg-white p-4 p-md-5 mb-4">
                                <h4 class="border-bottom pb-4"><i class="ti ti-package mr-3 text-primary"></i>Tipe
                                    Pesanan</h4>
                                <div class="row mb-5">
                                    <div class="form-group col-sm-6">
                                        <div class="select-container">
                                            <select class="form-control" id="txtTipePesanan">
                                                <option value='takeaway'>Takeaway</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div id='txtDeliveryInfo'>
                                    <h4 class="border-bottom pb-4"><i class="ti ti-user mr-3 text-primary"></i>Informasi
                                        Pemesanan</h4>
                                    <div class="row mb-5">
                                        <div class="form-group col-sm-6">
                                            <label>Nama Lengkap</label>
                                            <input type="text" class="form-control" id='txtNamaLengkapPd'>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label>No Hp</label>
                                            <input type="text" class="form-control" id='txtHpPd'
                                                placeholder="Masukkan nomor tanpa +, contoh: 6281234567890">
                                            <small class="text-muted">Nomor harus diawali dengan 62 tanpa tanda "+"
                                                (contoh: 6281234567890)</small>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label>Alamat</label>
                                            <input type="text" class="form-control" id='txtAlamatPd'>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label>Email</label>
                                            <input type="text" class="form-control" id='txtEmailPd'>
                                        </div>
                                    </div>
                                    <div>
                                        <ul>
                                            <li><i>Apabila anda sudah menjadi pelanggan, masukkan nomor handphone yang
                                                    sudah terdaftar</i></li>
                                            <li><i>Pastikan alamat benar</i></li>
                                            <li><i>Kode pemesanan akan dikirim melalui email &amp; nomor handphone,
                                                    untuk itu pastikan email yang anda masukkan valid</i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div id='divTipePembayaran'>
                                    <h4 class="border-bottom pb-4"><i
                                            class="ti ti-wallet mr-3 text-primary"></i>Pembayaran</h4>
                                    <div class="row text-lg">
                                        <div class="form-group col-sm-6">
                                            <div class="select-container">
                                                <select class="form-control" id="txtTipePembayaran">
                                                    <option value='none'>-- Pilih tipe pembayaran --</option>
                                                    at</option>
                                                    <option value="qris">QRIS</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="qrisPayment" style="display: none;">
                                        <h5>Scan QRIS untuk pembayaran:</h5>
                                        <img src=" <?= STYLEBASE; ?>/home/img/QRIS.png" alt="QRIS"
                                            style="width: 200px; cursor: pointer;" data-toggle="modal"
                                            data-target="#qrisModal">
                                    </div>
                                    <div id="uploadBuktiBayar" style="display: none;">
                                        <h5>Upload Bukti Pembayaran:</h5>
                                        <input type="file" class="form-control" id="buktiBayar" accept="image/*">
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <div id='statButtonPesan'>Memproses Pesanan ... </div>
                                <button id='btnPesanSekarang' class="btn btn-primary btn-lg"
                                    @click='pesanAtc'><span>Pesan Sekarang</span></button>
                                <input type="hidden" value="<?= $data['kdTemp']; ?>" id='txtKdPesananHidden'>
                            </div>
                        </div>
                    </div>
                </div>

            </section>

            <!-- Footer -->
            <footer id="footer" class="bg-dark dark">

                <div class="container">
                    <!-- Footer 1st Row -->
                    <div class="footer-first-row row">
                        <div class="col-lg-3 text-center">
                            <a href="index.html"><img src="assets/img/logo-light.svg" alt="" width="88"
                                    class="mt-5 mb-5"></a>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <h5 class="text-muted">Promo terbaru</h5>
                            <ul class="list-posts">
                                <?php foreach ($data['promo'] as $dp) : ?>
                                    <li>
                                        <a href="#!" class="title"><?= $dp['nama']; ?></a>
                                        <span class="date"><?= $dp['deks']; ?></span>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                        <div class="col-lg-5 col-md-6">

                            <h5 class="text-muted mb-3">Social Media</h5>
                            <a href="https://maps.app.goo.gl/iCkEQzQeBo3H5b2w5"
                                class="icon icon-social icon-circle icon-sm icon-facebook"><i class="fa fa-map"></i></a>
                            <a href="https://g.co/kgs/w8TvTzA"
                                class="icon icon-social icon-circle icon-sm icon-google"><i
                                    class="fa fa-google"></i></a>
                            <a href="https://wa.me/082154579220"
                                class="icon icon-social icon-circle icon-sm icon-twitter"><i
                                    class="fa fa-whatsapp"></i></a>
                            <a href="https://www.instagram.com/tara.coffee.id/"
                                class="icon icon-social icon-circle icon-sm icon-instagram"><i
                                    class="fa fa-instagram"></i></a>
                        </div>
                    </div>
                    <!-- Footer 2nd Row -->
                    <div class="footer-second-row">
                        <span class="text-sm text-muted">Tara Cafe <br> Develop By Safina Nurhidayanti</span>
                    </div>
                </div>

                <!-- Back To Top -->
                <button id="back-to-top" class="back-to-top"><i class="ti ti-angle-up"></i></button>

            </footer>
            <!-- Footer / End -->

        </div>
        <!-- Content / End -->


        <!-- Panel Mobile -->
        <nav id="panel-mobile">
            <div class="module module-logo bg-dark dark">
                <a href="#">
                    <img src="assets/img/logo-light.svg" alt="" width="88">
                </a>
                <button class="close" data-toggle="panel-mobile"><i class="ti ti-close"></i></button>
            </div>
            <nav class="module module-navigation"></nav>
            <div class="module module-social">
                <h6 class="text-sm mb-3">Ikuti Kami!</h6>
                <a href="https://maps.app.goo.gl/iCkEQzQeBo3H5b2w5"
                    class="icon icon-social icon-circle icon-sm icon-facebook"><i class="fa fa-map"></i></a>
                <a href="https://g.co/kgs/w8TvTzA" class="icon icon-social icon-circle icon-sm icon-google"><i
                        class="fa fa-google"></i></a>
                <a href="https://wa.me/082154579220" class="icon icon-social icon-circle icon-sm icon-twitter"><i
                        class="fa fa-whatsapp"></i></a>
                <a href="https://www.instagram.com/tara.coffee.id/"
                    class="icon icon-social icon-circle icon-sm icon-instagram"><i class="fa fa-instagram"></i></a>
            </div>
        </nav>
        <!-- Body Overlay -->
        <div id="body-overlay"></div>
    </div>

    <!-- Modal for QRIS Zoom -->
    <div class="modal fade" id="qrisModal" tabindex="-1" role="dialog" aria-labelledby="qrisModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="qrisModalLabel">QRIS Payment</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <img src="<?= STYLEBASE; ?>/home/img/QRIS.png" alt="QRIS" style="width: 100%;">
                </div>
            </div>
        </div>
    </div>
    <script src="https://www.gstatic.com/firebasejs/7.17.1/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.17.0/firebase-firestore.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.17.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.17.0/firebase-database.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="<?= HOMEBASE; ?>ladun/home/dist/js/core.js"></script>
    <script>
        const server = "<?= HOMEBASE; ?>";
    </script>
    <script src="<?= HOMEBASE; ?>ladun/home/js/takeaway.js"></script>
    <script>
        document.getElementById('txtTipePembayaran').addEventListener('change', function() {
            var tipePembayaran = this.value;
            if (tipePembayaran === 'qris') {
                document.getElementById('qrisPayment').style.display = 'block';
                document.getElementById('uploadBuktiBayar').style.display = 'block';
            } else if (tipePembayaran === 'cash') {
                document.getElementById('qrisPayment').style.display = 'none';
                document.getElementById('uploadBuktiBayar').style.display = 'block';
            } else {
                document.getElementById('qrisPayment').style.display = 'none';
                document.getElementById('uploadBuktiBayar').style.display = 'none';
            }
        });
    </script>
</body>

</html>