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
		  "ajax": "modul/rapor/kesehatan.php?kelas="+kelas+"&smt="+smt+"&tapel="+tapel,
		  "columnDefs": [
			{ "sortable": false, "targets": [5] }
		  ]
		});
		$('#modalkesehatan').on('show.bs.modal', function (e) {
            var rowid = $(e.relatedTarget).data('pdid');
			var rowsmt = $(e.relatedTarget).data('smt');
			var rowtapel = $(e.relatedTarget).data('tapel');
			var rowkelas = $(e.relatedTarget).data('kelas');
            //menggunakan fungsi ajax untuk pengambilan data
            $.ajax({
                type : 'post',
                url : 'modul/rapor/modal_siswa.php',
                data :  'rowid='+ rowid +'&smt='+rowsmt+'&tapel='+rowtapel+'&kelas='+rowkelas,
				beforeSend: function()
						{	
							$(".fetched-data").html('<i class="fa fa-spinner fa-pulse fa-fw"></i> Loading ...');
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
			  "ajax": "modul/rapor/kesehatan.php?kelas="+kelas+"&smt="+smt+"&tapel="+tapel,
			  "columnDefs": [
				{ "sortable": false, "targets": [5] }
			  ]
			});
		});
	});