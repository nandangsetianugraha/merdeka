"use strict";
var manageMemberTable;
	$(document).ready(function() {
		var kelas = $('#kelas').val();
		var tapel = $('#tapel').val();
		var smt = $('#smt').val();
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
		  "ajax": "modul/siswa/siswa.php?kelas="+kelas+"&smt="+smt+"&tapel="+tapel,
		  "columnDefs": [
			{ "sortable": false, "targets": [5] }
		  ]
		});
		$('#modalsiswa').on('show.bs.modal', function (e) {
            var rowid = $(e.relatedTarget).data('siswa');
            //menggunakan fungsi ajax untuk pengambilan data
            $.ajax({
                type : 'post',
                url : 'modul/siswa/modal_siswa.php',
                data :  'rowid='+ rowid,
				beforeSend: function()
						{	
							$(".fetched-data").html('<div class="block block-rounded"><div class="block-content">Loading.....<br/><div class="spinner-grow spinner-grow text-primary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-secondary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-success" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-danger" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-warning" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-info" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-light" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-dark" role="status"><span class="sr-only">Loading...</span></div></div></div>');
						},
                success : function(data){
                $('.fetched-data').html(data);//menampilkan data ke dalam modal
                }
            });
        });
		$('#kelas').change(function(){
			var kelas = $('#kelas').val();
			var tapel = $('#tapel').val();
			var smt = $('#smt').val();
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
			  "ajax": "modul/siswa/siswa.php?kelas="+kelas+"&smt="+smt+"&tapel="+tapel,
			  "columnDefs": [
				{ "sortable": false, "targets": [5] }
			  ]
			});
		});
	});