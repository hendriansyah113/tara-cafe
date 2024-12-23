<?php
$data['namaResto'] = $data['namaResto'];
$this->bind('layout/home_header', $data);
?>

<!-- Content -->
<div id="content">

    <!-- Section -->
    <section class="section bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-4">
                    <span class="icon icon-xl icon-success"><i class="ti ti-check-box"></i></span>
                    <h1 class="mb-2">Terima kasih atas pesanan Anda!</h1>
                    <h4 class="text-muted mb-5">Admin akan chat wa anda segera, silakan tunggu!!</h4>
                </div>
            </div>
        </div>
    </section>

</div>

<?php
$data['jsFile'] = 'konfirmasi';
$this->bind('layout/home_footer', $data);
?>