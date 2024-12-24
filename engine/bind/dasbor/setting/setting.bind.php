<div class="row" id='divSetting'>
    <div class="col-12 col-sm-6 col-lg-6">
        <div class="card">
            <div class="card-header">
                <h4>Pengaturan Umum</h4>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active show" id="home-tab" data-toggle="tab" href="#home" role="tab"
                            aria-controls="home" aria-selected="true">Basic</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab"
                            aria-controls="contact" aria-selected="false">Keuangan</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade active show" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="form-group">
                            <label>Nama Cafe</label>
                            <input type="text" class="form-control" id='txtNamaResto' v-model='namaResto' disabled>
                        </div>
                        <div class="form-group">
                            <label>Alamat Cafe </label><small> Pisahkan daerah dengan koma (,). Cth Kec. Panarung,
                                Kota Palangka Raya</small>
                            <input type="text" class="form-control" id='txtAlamatResto' v-model='alamatResto' disabled>
                        </div>
                        <div class="form-group">
                            <label>Nama Owner</label>
                            <input type="text" class="form-control" id='txtNamaOwnser' v-model='namaOwner' disabled>
                        </div>
                        <div class="form-group">
                            <label>Nomor Handphone Cafe</label>
                            <input type="text" class="form-control" id='txtHpRestoran' v-model='nomorHandphone'
                                disabled>
                        </div>
                        <div class="form-group">
                            <label>Email Cafe</label>
                            <input type="text" class="form-control" id='txtEmailRestoran' v-model='emailResto' disabled>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                        <div class="form-group">
                            <label>Tahun pembukuan awal</label>
                            <input type="number" class="form-control" id='txtPembukuanAwal' v-model='awalPembukuan'
                                disabled>
                        </div>
                        <div class="form-group">
                            <label>Saldo Awal</label>
                            <input type="number" class="form-control" id='txtSaldoAwal' v-model='saldoAwal' disabled>
                        </div>
                        <div class="form-group">
                            <label>Pajak (pph & ppn)</label>
                            <input type="number" class="form-control" id='txtPajak' v-model='tax' disabled>
                        </div>

                    </div>
                </div>
                <div>
                    <a href='#!' class="btn btn-lg btn-primary btn-icon icon-left" v-on:click='updateAtc'><i
                            :class='btnClass'></i> {{btnCap}}</a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-6">
        <div class="card card-primary">
            <div class="card-header">
                <h4>Detail Informasi Cafe</h4>
            </div>
            <div class="card-body">
                <div style="text-align: center;">
                    <img v-bind:src="'ladun/'+logo" style="width: 200px;">
                </div>
                <table class="table">
                    <tr>
                        <td>Nama Cafe</td>
                        <td style="text-align: left;">{{namaResto}}</td>
                    </tr>
                    <tr>
                        <td>Nama Owner</td>
                        <td style="text-align: left;">{{namaOwner}}</td>
                    </tr>
                    <tr>
                        <td>Nomor Handphone Cafe</td>
                        <td style="text-align: left;">{{nomorHandphone}}</td>
                    </tr>
                    <tr>
                        <td>Alamat Cafe</td>
                        <td style="text-align: left;">{{alamatResto}}</td>
                    </tr>
                    <tr>
                        <td>Tahun Pembukuan Awal</td>
                        <td style="text-align: left;">{{awalPembukuan}}</td>
                    </tr>
                    <tr>
                        <td>Saldo Awal</td>
                        <td style="text-align: left;">Rp. {{ Number(saldoAwal).toLocaleString() }}</td>
                    </tr>
                    <tr>
                        <td>Pajak</td>
                        <td style="text-align: left;">{{tax}}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="<?= STYLEBASE; ?>/dasbor/setting.js"></script>