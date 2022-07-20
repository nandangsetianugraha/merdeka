	var manageSiswa;
	var managePenempatan;
	$(document).ready(function() {
		var kelas = $('#kelas').val();
		var tapel = $('#tapel').val();
		var smt = $('#smt').val();
		manageSiswa = $("#manageSiswa").DataTable({
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
			"ajax": "modul/siswa/siswakosong.php?tapel="+tapel+"&smt="+smt,
			"order": []
		});
		managePenempatan = $("#managePenempatan").DataTable({
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
			"ajax": "modul/siswa/kelasku.php?kelas="+kelas+"&smt="+smt+"&tapel="+tapel,
			"order": []
		});
		$('#kelas').change(function(){
			//Mengambil value dari option select provinsi kemudian parameternya dikirim menggunakan ajax
			var kelas = $('#kelas').val();
			var tapel = $('#tapel').val();
			var smt = $('#smt').val();
			$("#managePenempatan").DataTable({
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
				"ajax": "modul/siswa/kelasku.php?kelas="+kelas+"&smt="+smt+"&tapel="+tapel,
				"order": []
			});
		});
	});
	function penempatanMember(id = null) {
		if(id) {

			// remove the error 
			$(".form-group").removeClass('has-error').removeClass('has-success');
			$(".text-danger").remove();
			$("#penempatan").modal('hide');
			// remove the id
			$("#member_id").remove();

			// fetch the member data
			$.ajax({
				url: 'modul/siswa/lihatsiswa.php',
				type: 'post',
				data: {member_id : id},
				dataType: 'json',
				success:function(response) {
					$("#penempatannama").val(response.nama);
					// mmeber id 
					$(".penempatanMemberModal").append('<input type="hidden" name="member_id" id="member_id" value="'+response.id+'"/>');
					// here update the member data
					$("#penempatanMemberForm").unbind('submit').bind('submit', function() {
						// remove error messages
						$(".text-danger").remove();
						var form = $(this);
						// validation
						var kelas = $("#kelas").val();
						var tapel = $("#tapel").val();
						var smt = $("#smt").val();
							$.ajax({
								url: form.attr('action'),
								type: form.attr('method'),
								data: form.serialize(),
								dataType: 'json',
								success:function(response) {
									if(response.success == true) {
										
										// reload the datatables
										manageSiswa.ajax.reload(null, false);
										managePenempatan = $("#managePenempatan").DataTable({
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
											"ajax": "../modul/siswa/kelasku.php?kelas="+kelas+"&smt="+smt+"&tapel="+tapel,
											"order": []
										});
										// this function is built in function of datatables;
										// remove the error 
										$("#penempatanMemberModal").modal('hide');
										$("#penempatan").modal('show');
									} else {
										swal('Terjadi kesalahan sistem', {
											buttons: false,
											timer: 1000,
										});
									}
								} // /success
							}); // /ajax
						return false;
					});
				} // /success
			}); // /fetch selected member info
		} else {
			swal('Error : Silahkan Refresh Halaman kembali!', {buttons: false,timer: 3000,});
		}
	}
	function outMember(id = null) {
		if(id) {
			// click on remove button
			$("#outBtn").unbind('click').bind('click', function() {
				$.ajax({
					url: '../modul/siswa/outsiswa.php',
					type: 'post',
					data: {member_id : id},
					dataType: 'json',
					success:function(response) {
						if(response.success == true) {	
var kelas = $("#kelas").val();
						var tapel = $("#tapel").val();
						var smt = $("#smt").val();						
							swal('Siswa berhasil dikeluarkan dari rombel!', {buttons: false,timer: 1000,});
							// refresh the table
							manageSiswa.ajax.reload(null, false);
							$("#managePenempatan").DataTable({
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
											"ajax": "../modul/siswa/kelasku.php?kelas="+kelas+"&smt="+smt+"&tapel="+tapel,
											"order": []
										});

							// close the modal
							$("#outMemberModal").modal('hide');

						} else {
							swal('Terjadi kesalahan sistem!', {
								buttons: false,
								timer: 1000,
							});
						}
					}
				});
			}); // click remove btn
		} else {
			swal('Error : Silahkan Refresh Halaman kembali!', {buttons: false,timer: 1000,});
		};
		
		function editMember(id = null) {
			if(id) {
				// remove the error 
				$(".form-group").removeClass('has-error').removeClass('has-success');
				$(".text-danger").remove();
				// empty the message div
				$(".edit-messages").html("");
				// remove the id
				$("#member_id").remove();
				$.ajax({
					url: 'modul/siswa/lihatsiswa.php',
					type: 'post',
					data: {member_id : id},
					dataType: 'json',
					success:function(response) {
						$("#editnama").val(response.nama);
						$("#edittempat").val(response.tempat);
						$("#edittanggal").val(response.tanggal);
						$("#editjk").val(response.jk);	
						$("#editnis").val(response.nis);	
						$("#editnisn").val(response.nisn);	
						$("#editnik").val(response.nik);	
						$("#editalamat").val(response.alamat);	
						$("#editayah").val(response.nama_ayah);	
						$("#editibu").val(response.nama_ibu);	

						// mmeber id 
						$(".editMemberModal").append('<input type="hidden" name="member_id" id="member_id" value="'+response.id+'"/>');

						// here update the member data
						$("#editMemberForm").unbind('submit').bind('submit', function() {
							// remove error messages
							$(".text-danger").remove();

							var form = $(this);

							// validation
							var editnama = $("#editnama").val();
							var edittempat = $("#edittempat").val();
							var edittanggal = $("#edittanggal").val();
							var editjk = $("#editjk").val();
							var editnis = $("#editnis").val();
							var editnisn = $("#editnisn").val();
							var editnik = $("#editnik").val();
							var editalamat = $("#editalamat").val();
							var editayah = $("#editayah").val();
							var editibu = $("#editibu").val();
								$.ajax({
									url: form.attr('action'),
									type: form.attr('method'),
									data: form.serialize(),
									dataType: 'json',
									success:function(response) {
										if(response.success == true) {
											$.notify({
												icon: 'flaticon-alarm-1',
												title: 'Sukses',
												message: response.messages,
											},{
												type: 'info',
												placement: {
												from: "bottom",
												align: "left"
											},
												time: 10,
											});

											// reload the datatables
											manageMemberTable.ajax.reload(null, false);
											// this function is built in function of datatables;

											// remove the error 
											$("#editMemberModal").modal('hide');
										} else {
											$.notify({
												icon: 'flaticon-alarm-1',
												title: 'Sukses',
												message: response.messages,
											},{
												type: 'info',
												placement: {
												from: "bottom",
												align: "left"
											},
												time: 10,
											});
										}
									} // /success
								}); // /ajax

							return false;
						});

					} // /success
				}); // /fetch selected member info
			}else{
				swal('Error : Silahkan Refresh Halaman kembali!', {buttons: false,timer: 3000,});
			}
		}
	}