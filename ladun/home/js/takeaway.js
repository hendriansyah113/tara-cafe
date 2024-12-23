var deliveryOrderProses = server + "home/deliveryOrderProses";

// VUE OBJECT 
var divCart = new Vue({
    el : '#divCart',
    data : {
        tipePesanan : 'takeaway',
        pd : [{nama : '', hp : '', alamat : '', email : ''}],
        kdPesanan : '',
        buktiBayar: null
    },
    methods : {
        pesanAtc : function()
        {
            if(this.buktiBayar === null){
                pesanUmumApp('warning', 'Upload bukti pembayaran!!', 'Harap upload bukti pembayaran!!');
            }else{
                setNGoTakeaway();
            }
        },
        handleFileUpload: function(event) {
            this.buktiBayar = event.target.files[0];
        }
    }
});

$('#statButtonPesan').hide();  
divCart.kdPesanan = document.getElementById('txtKdPesananHidden').value;
// FUNCTION 
function setNGoTakeaway()
{
    divCart.pd[0].email = document.getElementById('txtEmailPd').value;
    divCart.pd[0].nama = document.getElementById('txtNamaLengkapPd').value;
    divCart.pd[0].alamat = document.getElementById('txtAlamatPd').value;
    divCart.pd[0].hp = document.getElementById('txtHpPd').value;
    let email = divCart.pd[0].email;
    let nama = divCart.pd[0].nama;
    let alamat = divCart.pd[0].alamat;
    let hp = divCart.pd[0].hp;
    let kdPesanan = divCart.kdPesanan;
    let buktiBayar = divCart.buktiBayar;

    if(email === '' || nama === '' || alamat === '' || hp === ''){
        pesanUmumApp('warning', 'Isi field!!', 'Harap isi semua field!!');
    }else{
        let formData = new FormData();
        formData.append('email', email);
        formData.append('nama', nama);
        formData.append('alamat', alamat);
        formData.append('hp', hp);
        formData.append('kdPesanan', kdPesanan);
        formData.append('buktiBayar', buktiBayar);

        Swal.fire({
            title: "Konfirmasi",
            text: "Apakah data data anda sudah benar? Proses transaksi?",
            icon: "info",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Ya",
            cancelButtonText: "Tidak",
        }).then((result) => {
            if (result.value) {
                $('#btnPesanSekarang').hide();
                $('#statButtonPesan').show();
                $(".form-control").attr("disabled", "disabled");
                $.ajax({
                    url: deliveryOrderProses,
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(data) {
                        try {
                            let obj = JSON.parse(data);
                            if (obj.status === 'success') {
                                pesanUmumApp('success', 'Pemesanan sukses', 'Pemesanan anda telah di proses, silahkan cek email anda untuk mendapatkan informasi pemesanan');
                                setTimeout(function() {
                                    window.location.assign(server + 'home/konfirmasi');
                                }, 1000);
                            } else {
                                 pesanUmumApp('success', 'Pemesanan sukses', 'Pemesanan anda telah di proses, silahkan cek email anda untuk mendapatkan informasi pemesanan');
                                setTimeout(function() {
                                    window.location.assign(server + 'home/konfirmasi');
                                }, 1000);
                            }
                        } catch (e) {
                            console.error('Error parsing JSON:', e);
                            console.error('Response from server:', data);
                             pesanUmumApp('success', 'Pemesanan sukses', 'Pemesanan anda telah di proses, silahkan cek email anda untuk mendapatkan informasi pemesanan');
                                setTimeout(function() {
                                    window.location.assign(server + 'home/konfirmasi');
                                }, 1000);
                        }
                    }
                });
            }
        });
    }
}

document.getElementById('buktiBayar').addEventListener('change', function(event) {
    divCart.handleFileUpload(event);
});

function pesanUmumApp(icon, title, text)
{
  Swal.fire({
    icon : icon,
    title : title,
    text : text
  });
}