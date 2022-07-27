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
$sql = "SELECT * FROM ekskul order by id_ekskul asc";
$query = $connect->query($sql);
?>

<!-- Connections -->
				
		<form class="form" action="modul/rapor/simpan-ekskul.php" autocomplete="off" method="POST" id="ekskulForm">
          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <h3 class="block-title">
                <i class="fa fa-share-alt me-1 text-muted"></i> Data Ekstrakurikuler <?=$siswa['nama'];?>
				<input type="hidden" name="idpd" class="form-control"  value="<?=$siswa['peserta_didik_id'];?>">
				<input type="hidden" name="smt" class="form-control"  value="<?=$smt;?>">
				<input type="hidden" name="tapel" class="form-control"  value="<?=$tapel;?>">
				<input type="hidden" name="kelas" class="form-control"  value="<?=$kelas;?>">
              </h3>
            </div>
            <div class="block-content">
				<div class="mb-4">
					<label class="form-label" for="example-select">Nama Ekstrakurikuler</label>
					<select class="form-select" id="ide" name="ide">
					<?php 
					while ($row = $query->fetch_assoc()) {
					?>
						<option value="<?=$row['id_ekskul'];?>"><?=$row['nama_ekskul'];?></option>
					<?php 
					}
					?>
					</select>
				</div>
				<div class="mb-4">
					<label class="form-label" for="example-select-multiple">Deskripsi Ekstrakurikuler</label>
					<textarea name="keterangan" class="form-control" aria-label="With textarea"></textarea>
				</div>
				<div class="block-content block-content-full block-content-sm text-end border-top">
					<button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal"> Tutup</button>
					<button type="submit" class="btn btn-alt-primary">  Update</button>
				</div>
            </div>
          </div>
		  </form>
          <!-- END Connections -->

<script>
	$("#ekskulForm").unbind('submit').bind('submit', function() {
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
						$("#modalekskul").modal('hide');
						// reload the datatables
						var kelas = $('#kelas').val();
						var tapel = $('#tapel').val();
						var smt = $('#smt').val();
						$.ajax({
							type : 'GET',
							url : 'modul/rapor/data-ekstrakurikuler.php',
							data :  'kelas='+kelas+'&smt='+smt+'&tapel='+tapel,
							beforeSend: function()
							{	
								$("#nilaiHarian").html('<p class="text-center"><div class="spinner-grow spinner-grow text-primary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-secondary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-success" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-danger" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-warning" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-info" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-light" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-dark" role="status"><span class="sr-only">Loading...</span></div></p>');
							},
							success: function (data) {

								//jika data berhasil didapatkan, tampilkan ke dalam option select mp
								$("#nilaiHarian").html(data);
							}
						});
						Codebase.helpers('jq-notify', {
							align: 'center',             // 'right', 'left', 'center'
							from: 'bottom',                // 'top', 'bottom'
							type: 'success',               // 'info', 'success', 'warning', 'danger'
							icon: 'fa fa-info me-5',    // Icon class
							message: response.messages
						});
					} else {
						$("#modalekskul").modal('hide');
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
		}); // /submit form for create member
</script>