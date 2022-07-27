"use strict";
var tpTable;
	$(document).ready(function() {
		$('#kelas').change(function(){
			//Mengambil value dari option select kd kemudian parameternya dikirim menggunakan ajax
			var kelas=$('#kelas').val();
			$.ajax({
				type : 'GET',
				url : 'modul/materi/mp.php',
				data :  'kelas='+kelas,
				beforeSend: function()
				{	
					$("#nilaiHarian").html('<p class="text-center"><div class="spinner-grow spinner-grow text-primary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-secondary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-success" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-danger" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-warning" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-info" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-light" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-dark" role="status"><span class="sr-only">Loading...</span></div></p>');
				},
				success: function (data) {

					//jika data berhasil didapatkan, tampilkan ke dalam option select mp
					$("#mp").html(data);
					$("#nilaiHarian").html('<div class="alert alert-info alert-dismissible"><h4><i class="icon fa fa-info"></i> Informasi</h4>Silahkan Pilih Mapel</div>');
				}
			});
		});
		$('#mp').change(function(){
			//Mengambil value dari option select kd kemudian parameternya dikirim menggunakan ajax
			var kelas=$('#kelas').val();
			var mp=$('#mp').val();
			var smt=$('#smt').val();
			var tapel=$('#tapel').val();
			$.ajax({
				type : 'GET',
				url : 'modul/rapor/rapor.php',
				data :  'kelas='+kelas+'&mp='+mp+'&smt='+smt+'&tapel='+tapel,
				beforeSend: function()
				{	
					$("#nilaiHarian").html('<p class="text-center"><div class="spinner-grow spinner-grow text-primary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-secondary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-success" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-danger" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-warning" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-info" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-light" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-dark" role="status"><span class="sr-only">Loading...</span></div></p>');
				},
				success: function (data) {

					//jika data berhasil didapatkan, tampilkan ke dalam option select mp
					$("#nilaiHarian").html(data);
				}
			});
		});
		$(document).on('click', '#getRaport', function(e){
		
			e.preventDefault();
			
			var ukelas = $(this).data('kelas');
			var utapel = $(this).data('tapel');			// it will get id of clicked row
			var usmt = $(this).data('smt');
			var ump = $(this).data('mp');
			var updid = $(this).data('pdid');
			
			$.ajax({
				type : 'POST',
				url : 'modul/rapor/simpan-rapor.php',
				data :  'kelas='+ukelas+'&mp='+ump+'&smt='+usmt+'&tapel='+utapel+'&pdid='+updid,
				dataType : 'json',
				beforeSend: function()
				{	
					$("#nilaiHarian").html('<p class="text-center"><h3>Tunggu sebentar ..... sedang generate rapor</h3><div class="spinner-grow spinner-grow text-primary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-secondary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-success" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-danger" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-warning" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-info" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-light" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-dark" role="status"><span class="sr-only">Loading...</span></div></p>');
				},
				success:function(response) {
					if(response.success == true) {
						//$("#modalmateri").modal('hide');
						Codebase.helpers('jq-notify', {
							align: 'center',             // 'right', 'left', 'center'
							from: 'bottom',                // 'top', 'bottom'
							type: 'success',               // 'info', 'success', 'warning', 'danger'
							icon: 'fa fa-info me-5',    // Icon class
							message: response.messages
						});
						//swal(response.messages, {buttons: false,timer: 2000,});
						var kelas=$('#kelas').val();
						var mp=$('#mp').val();
						var smt=$('#smt').val();
						var tapel=$('#tapel').val();
						$.ajax({
							type : 'GET',
							url : 'modul/rapor/rapor.php',
							data :  'kelas='+kelas+'&mp='+mp+'&smt='+smt+'&tapel='+tapel,
							beforeSend: function()
							{	
								$("#nilaiHarian").html('<p class="text-center"><div class="spinner-grow spinner-grow text-primary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-secondary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-success" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-danger" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-warning" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-info" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-light" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-dark" role="status"><span class="sr-only">Loading...</span></div></p>');
							},
							success: function (data) {

								//jika data berhasil didapatkan, tampilkan ke dalam option select mp
								$("#nilaiHarian").html(data);
							}
						});
					} else {
						Swal.fire("Kesalahan",response.messages,"error");
						var kelas=$('#kelas').val();
						var mp=$('#mp').val();
						var smt=$('#smt').val();
						var tapel=$('#tapel').val();
						$.ajax({
							type : 'GET',
							url : 'modul/rapor/rapor.php',
							data :  'kelas='+kelas+'&mp='+mp+'&smt='+smt+'&tapel='+tapel,
							beforeSend: function()
							{	
								$("#nilaiHarian").html('<p class="text-center"><div class="spinner-grow spinner-grow text-primary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-secondary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-success" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-danger" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-warning" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-info" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-light" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-dark" role="status"><span class="sr-only">Loading...</span></div></p>');
							},
							success: function (data) {

								//jika data berhasil didapatkan, tampilkan ke dalam option select mp
								$("#nilaiHarian").html(data);
							}
						});
					}  // /else
				} // success 
			});			
		});
	});