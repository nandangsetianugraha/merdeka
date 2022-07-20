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
					$("#nilaiHarian").html('<p class="text-center"><img src="loading.gif"></p>');
				},
				success: function (data) {

					//jika data berhasil didapatkan, tampilkan ke dalam option select mp
					$("#mp").html(data);
					$("#materi").html("");
					$("#nilaiHarian").html('<div class="alert alert-info alert-dismissible"><h4><i class="icon fa fa-info"></i> Informasi</h4>Silahkan Pilih Mapel</div>');
				}
			});
		});
		$('#mp').change(function(){
			//Mengambil value dari option select kd kemudian parameternya dikirim menggunakan ajax
			var kelas=$('#kelas').val();
			var mp=$('#mp').val();
			var smt=$('#smt').val();
			$.ajax({
				type : 'GET',
				url : 'modul/materi/materi.php',
				data :  'kelas='+kelas+'&mp='+mp+'&smt='+smt,
				beforeSend: function()
				{	
					$("#nilaiHarian").html('<p class="text-center"><img src="loading.gif"></p>');
				},
				success: function (data) {

					//jika data berhasil didapatkan, tampilkan ke dalam option select mp
					$("#materi").html(data);
					$("#nilaiHarian").html('<div class="alert alert-info alert-dismissible"><h4><i class="icon fa fa-info"></i> Informasi</h4>Silahkan Pilih Materi</div>');
				}
			});
		});
		$('#materi').change(function(){
			//Mengambil value dari option select kd kemudian parameternya dikirim menggunakan ajax
			var kelas=$('#kelas').val();
			var mp=$('#mp').val();
			var smt=$('#smt').val();
			var materi=$('#materi').val();
			$.ajax({
				type : 'GET',
				url : 'modul/materi/tujuan.php',
				data :  'kelas='+kelas+'&mp='+mp+'&materi='+materi,
				beforeSend: function()
				{	
					$("#nilaiHarian").html('<p class="text-center"><img src="loading.gif"></p>');
				},
				success: function (data) {

					//jika data berhasil didapatkan, tampilkan ke dalam option select mp
					$("#nilaiHarian").html(data);
				}
			});
		});
		
		$("#buatmateri").unbind('submit').bind('submit', function() {
			var form = $(this);
			//submi the form to server
			$.ajax({
				url : form.attr('action'),
				type : form.attr('method'),
				data : form.serialize(),
				dataType : 'json',
				success:function(response) {
					if(response.success == true) {
						Codebase.helpers('jq-notify', {
							align: 'center',             // 'right', 'left', 'center'
							from: 'bottom',                // 'top', 'bottom'
							type: 'success',               // 'info', 'success', 'warning', 'danger'
							icon: 'fa fa-info me-5',    // Icon class
							message: response.messages
						});
						//swal(response.messages, {buttons: false,timer: 2000,});
						$("#modalmateri").modal('hide');
						var kelas = $('#kelas').val();
						var tapel = $('#tapel').val();
						var smt = $('#smt').val();
						var mp = $('#mp').val();
						$("#manageMemberTable").dataTable({
						  pageLength: 5,
						  lengthMenu: [
							 [5, 10, 20],
							 [5, 10, 20],
						  ],
						  autoWidth: !1,
						  responsive: !0,
						  "destroy":true,
						  "searching": true,
						  "paging":true,
						  "ajax": "modul/materi/lm.php?kelas="+kelas+"&smt="+smt+"&tapel="+tapel+"&mp="+mp
						});
						//$("#createKDFormk")[0].reset();
						// this function is built in function of datatables;
					} else {
						Codebase.helpers('jq-notify', {
							align: 'center',             // 'right', 'left', 'center'
							from: 'bottom',                // 'top', 'bottom'
							type: 'success',               // 'info', 'success', 'warning', 'danger'
							icon: 'fa fa-info me-5',    // Icon class
							message: response.messages
						});
					}  // /else
				} // success  
			}); // ajax subit 				
			return false;
		}); // /submit form for Materi
	});