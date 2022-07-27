<?php 
require_once '../../inc/db_connect.php';
$ids=$_POST['rowid'];
$tapel=$_POST['tapel'];
$smt=$_POST['smt'];
$kelas=$_POST['kelas'];
$siswa=$connect->query("select * from siswa where peserta_didik_id='$ids'")->fetch_assoc();
$filegbr = 'https://sdi-aljannah.web.id/apins/images/siswa/'.$siswa['avatar'];
$file_headerss = @get_headers($filegbr);
if($file_headerss[0] == 'HTTP/1.1 404 Not Found') {
	//$exists = false;
	$avatarm="https://sdi-aljannah.web.id/apins/images/siswa/user-default.png";
}else {
	//$exists = true;
	$avatarm='https://sdi-aljannah.web.id/apins/images/siswa/'.$siswa['avatar'];
};
if($smt==1){
	$tahun1=substr($tapel,0,4);
	$tahun2=substr($tapel,5,4);
	$tahunseb1=(int) $tahun1-1;
	$tahunseb2=(int) $tahun2-1;
	$tapelseb=$tahunseb1."/".$tahunseb2;
	$smtseb=2;
}else{
	$tapelseb=$tapel;
	$smtseb=1;
};
$ceks=$connect->query("SELECT * FROM data_kesehatan WHERE peserta_didik_id='$ids' AND smt='$smt' AND tapel='$tapel'")->num_rows;
if($ceks>0){
	$kes=$connect->query("SELECT * FROM data_kesehatan WHERE peserta_didik_id='$ids' AND smt='$smtseb' AND tapel='$tapelseb'")->fetch_assoc();
	$kess=$connect->query("SELECT * FROM data_kesehatan WHERE peserta_didik_id='$ids' AND smt='$smt' AND tapel='$tapel'")->fetch_assoc();
?>

<!-- Connections -->
				
		<form class="form" action="modul/rapor/simpankesehatan.php" autocomplete="off" method="POST" id="kesehatanForm">
          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <h3 class="block-title">
                <i class="fa fa-share-alt me-1 text-muted"></i> Data Kesehatan <?=$siswa['nama'];?>
				<input type="hidden" name="idpd" class="form-control"  value="<?=$siswa['peserta_didik_id'];?>">
				<input type="hidden" name="smt" class="form-control"  value="<?=$smt;?>">
				<input type="hidden" name="tapel" class="form-control"  value="<?=$tapel;?>">
				<input type="hidden" name="kelas" class="form-control"  value="<?=$kelas;?>">
              </h3>
            </div>
            <div class="block-content">
				<table class="table table-bordered table-striped table-vcenter js-dataTable-full" id="tbKesehatan">
					<thead>
					  <tr>
						<th>Aspek</th>
						<th>Semester Lalu</th>
						<th>Semester Sekarang</th>
					  </tr>
					</thead>
					<tbody>
					  <tr>
						<td>Tinggi Badan (cm)</td>
						<td><input type="text" class="form-control" value="<?=$kes['tinggi'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="tinggi" value="<?=$kess['tinggi'];?>"></td>
					  </tr>
					  <tr>
						<td>Berat Badan (Kg)</td>
						<td><input type="text" class="form-control" value="<?=$kes['berat'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="berat" value="<?=$kess['berat'];?>"></td>
					  </tr>
					  <tr>
						<td>Pendengaran</td>
						<td><input type="text" class="form-control" value="<?=$kes['pendengaran'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="pendengaran" value="<?=$kess['pendengaran'];?>"></td>
					  </tr>
					  <tr>
						<td>Penglihatan</td>
						<td><input type="text" class="form-control" value="<?=$kes['penglihatan'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="penglihatan" value="<?=$kess['penglihatan'];?>"></td>
					  </tr>
					  <tr>
						<td>Gigi</td>
						<td><input type="text" class="form-control" value="<?=$kes['gigi'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="gigi" value="<?=$kess['gigi'];?>"></td>
					  </tr>
					  <tr>
						<td>Lainnya</td>
						<td><input type="text" class="form-control" value="<?=$kes['lainnya'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="lainnya" value="<?=$kess['lainnya'];?>"></td>
					  </tr>
					</tbody>
				</table>
                <div class="block-content block-content-full block-content-sm text-end border-top">
					<button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal"> Tutup</button>
					<button type="submit" class="btn btn-alt-primary">  Update</button>
				</div>
            </div>
          </div>
		  </form>
          <!-- END Connections -->
<?php }else{ 
$kes=$connect->query("SELECT * FROM data_kesehatan WHERE peserta_didik_id='$ids' AND smt='$smtseb' AND tapel='$tapelseb'")->fetch_assoc();
?>
		  <form class="form" action="modul/rapor/simpankesehatan.php" autocomplete="off" method="POST" id="kesehatanForm">
          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <h3 class="block-title">
                <i class="fa fa-share-alt me-1 text-muted"></i> Data Kesehatan <?=$siswa['nama'];?>
				<input type="hidden" name="idpd" class="form-control"  value="<?=$siswa['peserta_didik_id'];?>">
				<input type="hidden" name="smt" class="form-control"  value="<?=$smt;?>">
				<input type="hidden" name="tapel" class="form-control"  value="<?=$tapel;?>">
				<input type="hidden" name="kelas" class="form-control"  value="<?=$kelas;?>">
              </h3>
            </div>
            <div class="block-content">
				<table class="table table-bordered table-striped table-vcenter js-dataTable-full" id="tbKesehatan">
					<thead>
					  <tr>
						<th>Aspek</th>
						<th>Semester Lalu</th>
						<th>Semester Sekarang</th>
					  </tr>
					</thead>
					<tbody>
					  <tr>
						<td>Tinggi Badan (cm)</td>
						<td><input type="text" class="form-control" value="<?=$kes['tinggi'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="tinggi"></td>
					  </tr>
					  <tr>
						<td>Berat Badan (Kg)</td>
						<td><input type="text" class="form-control" value="<?=$kes['berat'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="berat"></td>
					  </tr>
					  <tr>
						<td>Pendengaran</td>
						<td><input type="text" class="form-control" value="<?=$kes['pendengaran'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="pendengaran"></td>
					  </tr>
					  <tr>
						<td>Penglihatan</td>
						<td><input type="text" class="form-control" value="<?=$kes['penglihatan'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="penglihatan"></td>
					  </tr>
					  <tr>
						<td>Gigi</td>
						<td><input type="text" class="form-control" value="<?=$kes['gigi'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="gigi"></td>
					  </tr>
					  <tr>
						<td>Lainnya</td>
						<td><input type="text" class="form-control" value="<?=$kes['lainnya'];?>" readonly="true"></td>
						<td><input type="text" class="form-control" name="lainnya"></td>
					  </tr>
					</tbody>
				</table>
                <div class="block-content block-content-full block-content-sm text-end border-top">
					<button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal"> Tutup</button>
					<button type="submit" class="btn btn-alt-primary">  Simpan</button>
				</div>
            </div>
          </div>
		  </form>
<?php } ?>
				
                
                <!-- END Block Tabs Alternative Style -->
<script>
	$("#kesehatanForm").unbind('submit').bind('submit', function() {
			$(".text-danger").remove();
			var form = $(this);
			//submi the form to server
			$.ajax({
				url : form.attr('action'),
				type : form.attr('method'),
				data : form.serialize(),
				dataType : 'json',
				success:function(response) {
				// remove the error 
					$(".form-group").removeClass('has-error').removeClass('has-success');
					if(response.success == true) {
						//swal(response.messages, {buttons: false,timer: 2000,});
						// reset the form
						$("#modalkesehatan").modal('hide');
						// reload the datatables
						var kelas = $('#kelas').val();
						var tapel = $('#tapel').val();
						var smt = $('#smt').val();
						$("#tpTable").dataTable({
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
						Codebase.helpers('jq-notify', {
							align: 'center',             // 'right', 'left', 'center'
							from: 'bottom',                // 'top', 'bottom'
							type: 'success',               // 'info', 'success', 'warning', 'danger'
							icon: 'fa fa-info me-5',    // Icon class
							message: response.messages
						});
					} else {
					
					}  // /else
				} // success  
			}); // ajax subit 				
			return false;
		}); // /submit form for create member
</script>