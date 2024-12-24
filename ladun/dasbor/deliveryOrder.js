// ROUTE
var routeToGetDataDeliveryOrder = server + 'deliveryOrder/getDataDeliveryOrder';

// VUE OBJECT 
var divDeliveryOrder = new Vue({
    el : '#divDeliveryOrder',
    data : {

    },
    methods : {
        detailAtc : function(kdPesanan)
        {
            renderMenu('deliveryOrder/detailPesanan/'+kdPesanan);
            divJudul.judulForm = "Detail Pesanan";
        }
    }
});

// INISIALISASI 
$('#tblDeliveryOrder').dataTable({
    "searching" : true,
    "processing" : true,
    "serverSide": true,
    "ajax":{
        url : routeToGetDataDeliveryOrder,
        type: "post",
        error: function(){
            pesanUmumApp('warning', 'Error', 'Error menampilkan data');
        }
    },
    "columns": [
        { data: 0 }, // No
        { data: 1 }, // Kode Pesanan
        { data: 2 }, // Nama Pelanggan
        { data: 3 }, // Status
        { data: 4, render: function (data) { return new Date(data * 1000).toLocaleString(); } }, // Tanggal
        { data: 5, render: $.fn.dataTable.render.number(',', '.', 0, 'Rp. ') }, // Harga
        { data: 6 }, // Bukti Bayar
        { data: 7 }, // Detail
        { data: 8 }  // WhatsApp
    ],
    "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
        if (aData[1] == "Orderan di proses") {
          $('td', nRow).css('background-color', '#f7b7b8');
        }else if(aData[1] == 'Orderan di kirim'){
          $('td', nRow).css('background-color', '#b7e1f7');
        }else if(aData[1] == 'Orderan selesai'){
            $('td', nRow).css('background-color', '#dbffdf');
        }
      }
});

// FUNCTION 
$('#tblDeliveryOrder').on('click', '.btnDetail', function(){
    let kdPesanan = $(this).data('id');
    divDeliveryOrder.detailAtc(kdPesanan);
});

