<?php 
require_once '../../inc/db_connect.php';
$ids=$_POST['rowid'];
$siswa=$connect->query("select * from siswa where peserta_didik_id='$ids'")->fetch_assoc();
$filegbr = 'https://sdi-aljannah.web.id/apins/images/siswa/'.$siswa['avatar'];
$file_headerss = @get_headers($filegbr);
if($file_headerss[0] == 'HTTP/1.1 404 Not Found') {
	//$exists = false;
	$avatarm="user-default.png";
}else {
	//$exists = true;
	$avatarm='https://sdi-aljannah.web.id/apins/images/siswa/'.$siswa['avatar'];
};
?>

<!-- Connections -->
          <div class="block block-rounded">
            <div class="block-header block-header-default">
              <h3 class="block-title">
                <i class="fa fa-share-alt me-1 text-muted"></i> Biodata <?=$siswa['nama'];?>
              </h3>
            </div>
            <div class="block-content">
                <div class="row items-push">
                  <div class="col-lg-1">
                    <p class="text-muted">
                      <img class="img-avatar" src="<?=$avatarm;?>" alt="">
                    </p>
                  </div>
                  <div class="col-lg-11">
                    <ul class="nav nav-tabs nav-tabs-alt" role="tablist">
						<li class="nav-item">
						  <button type="button" class="nav-link active" id="btabs-static-home-tab" data-bs-toggle="tab" data-bs-target="#btabs-static-home" role="tab" aria-controls="btabs-static-home" aria-selected="true">
							Biodata Diri
						  </button>
						</li>
						<li class="nav-item">
						  <button type="button" class="nav-link" id="btabs-static-profile-tab" data-bs-toggle="tab" data-bs-target="#btabs-static-profile" role="tab" aria-controls="btabs-static-profile" aria-selected="false">
							Orang Tua
						  </button>
						</li>
					</ul>
					<div class="block-content tab-content">
							<div class="tab-pane active" id="btabs-static-home" role="tabpanel" aria-labelledby="btabs-static-home-tab">
								<div class="row mb-4">
								  <div class="col-8">
									<label class="form-label">Nama Lengkap</label>
									<input type="text" class="form-control" value="<?=$siswa['nama'];?>">
								  </div>
								  <div class="col-4">
									<label class="form-label">Jenis Kelamin</label>
									<select class="form-select" id="jk" name="jk">
										<option value="L" <?php if($siswa['jk']==="L"){echo "selected";} ?>>Laki-laki</option>
										<option value="P" <?php if($siswa['jk']==="P"){echo "selected";} ?>>Perempuan</option>
									</select>
								  </div>
								</div>
								<div class="row mb-4">
								  <div class="col-4">
									<label class="form-label">Tempat Lahir</label>
									<input type="text" class="form-control" value="<?=$siswa['tempat'];?>">
								  </div>
								  <div class="col-4">
									<label class="form-label">Tanggal Lahir</label>
									<input type="text" class="form-control" value="<?=$siswa['tanggal'];?>">
								  </div>
								  <div class="col-4">
									<label class="form-label">Pendidikan Sebelumnya</label>
									<input type="text" class="form-control" value="<?=$siswa['pend_sebelum'];?>">
								  </div>
								</div>
								<div class="row mb-4">
								  <div class="col-4">
									<label class="form-label">NIS</label>
									<input type="text" class="form-control" value="<?=$siswa['nis'];?>">
								  </div>
								  <div class="col-4">
									<label class="form-label">NISN</label>
									<input type="text" class="form-control" value="<?=$siswa['nisn'];?>">
								  </div>
								  <div class="col-4">
									<label class="form-label">NIK</label>
									<input type="text" class="form-control" value="<?=$siswa['nik'];?>">
								  </div>
								</div>
								<div class="row mb-4">
								  <div class="col-12">
									<label class="form-label">Alamat Siswa</label>
									<input type="text" class="form-control" value="<?=$siswa['alamat'];?>">
								  </div>
								</div>
							</div>
							<div class="tab-pane" id="btabs-static-profile" role="tabpanel" aria-labelledby="btabs-static-profile-tab">
								<div class="row mb-4">
								  <div class="col-6">
									<label class="form-label">Nama Ayah</label>
									<input type="text" class="form-control" value="<?=$siswa['nama_ayah'];?>">
								  </div>
								  <div class="col-6">
									<label class="form-label">Nama Ibu</label>
									<input type="text" class="form-control" value="<?=$siswa['nama_ibu'];?>">
								  </div>
								</div>
								<div class="row mb-4">
								  <div class="col-6">
									<label class="form-label">Pekerjaan Ayah</label>
									<select class="form-select" id="pek_ayah" name="pek_ayah">
									<?php 
									$sql = "select * from pekerjaan";
									$query = $connect->query($sql);
									while ($nk = $query->fetch_assoc()) {
									?>
										<option value="<?=$nk['id_pekerjaan'];?>" <?php if($siswa['pek_ayah']==$nk['id_pekerjaan']) echo "selected"; ?>><?=$nk['nama_pekerjaan'];?></option>
									<?php } ?>
									</select>
								  </div>
								  <div class="col-6">
									<label class="form-label">Nama Ibu</label>
									<select class="form-select" id="pek_ibu" name="pek_ibu">
									<?php 
									$sql1 = "select * from pekerjaan";
									$query1 = $connect->query($sql1);
									while ($nk1 = $query1->fetch_assoc()) {
									?>
										<option value="<?=$nk1['id_pekerjaan'];?>" <?php if($siswa['pek_ibu']==$nk1['id_pekerjaan']) echo "selected"; ?>><?=$nk1['nama_pekerjaan'];?></option>
									<?php } ?>
									</select>
								  </div>
								</div>
								<div class="row mb-4">
								  <div class="col-12">
									<label class="form-label">Jalan/Blok RT RW</label>
									<input type="text" class="form-control" value="<?=$siswa['jalan'];?>">
								  </div>
								</div>
								<div class="row mb-4">
								  <div class="col-3">
									<label class="form-label">Provinsi</label>
									<select class="form-select" id="provinsi" name="provinsi">
									<?php 
									$id_prov=$siswa['provinsi'];
									$sql2 = "select * from provinsi";
									$query2 = $connect->query($sql2);
									while ($nk2 = $query2->fetch_assoc()) {
									?>
										<option value="<?=$nk2['id_prov'];?>" <?php if($id_prov==$nk2['id_prov']) echo "selected"; ?>><?=$nk2['nama'];?></option>
									<?php } ?>
									</select>
								  </div>
								  <div class="col-3">
									<label class="form-label">Kabupaten</label>
									<select class="form-select" id="kabupaten" name="kabupaten">
									<?php 
									$id_kab=$siswa['kabupaten'];
									$sql3 = "select * from kabupaten where id_provinsi='$id_prov'";
									$query3 = $connect->query($sql3);
									while ($nk3 = $query3->fetch_assoc()) {
									?>
										<option value="<?=$nk3['id'];?>" <?php if($id_kab==$nk3['id']) echo "selected"; ?>><?=$nk3['nama'];?></option>
									<?php } ?>
									</select>
								  </div>
								  <div class="col-3">
									<label class="form-label">Kecamatan</label>
									<select class="form-select" id="kecamatan" name="kecamatan">
									<?php 
									$id_kec=$siswa['kecamatan'];
									$sql3 = "select * from kecamatan where id_kabupaten='$id_kab'";
									$query3 = $connect->query($sql3);
									while ($nk3 = $query3->fetch_assoc()) {
									?>
										<option value="<?=$nk3['id'];?>" <?php if($id_kec==$nk3['id']) echo "selected"; ?>><?=$nk3['nama'];?></option>
									<?php } ?>
									</select>
								  </div>
								  <div class="col-3">
									<label class="form-label">Desa/Kelurahan</label>
									<select class="form-select" id="kelurahan" name="kelurahan">
									<?php 
									$id_desa=$siswa['kelurahan'];
									$sql3 = "select * from desa where id_kecamatan='$id_kec'";
									$query3 = $connect->query($sql3);
									while ($nk3 = $query3->fetch_assoc()) {
									?>
										<option value="<?=$nk3['id'];?>" <?php if($id_desa==$nk3['id']) echo "selected"; ?>><?=$nk3['nama'];?></option>
									<?php } ?>
									</select>
								  </div>
								</div>
							</div>
						 </div>
				  </div>
                </div>
				<div class="block-content block-content-full block-content-sm text-end border-top">
							<button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">
							  Close
							</button>
							<button type="button" class="btn btn-alt-primary" data-bs-dismiss="modal">
							  Done
							</button>
						  </div>
            </div>
          </div>
          <!-- END Connections -->
				
                
                <!-- END Block Tabs Alternative Style -->
<script>
$('#provinsi').change(function(){
				//Mengambil value dari option select provinsi kemudian parameternya dikirim menggunakan ajax
				var prov = $('#provinsi').val();
				$.ajax({
					type : 'GET',
					url : 'inc/kabupaten.php',
					data :  'prov_id=' + prov,
					success: function (data) {
						//jika data berhasil didapatkan, tampilkan ke dalam option select kabupaten
						$("#kabupaten").html(data);
						$("#kecamatan").html("<option value='0'>Pilih Kecamatan</option>");
						$("#kelurahan").html("<option value='0'>Pilih Kelurahan</option>");
					}
				});
		});

		$('#kabupaten').change(function(){
				//Mengambil value dari option select provinsi kemudian parameternya dikirim menggunakan ajax
				var kab = $('#kabupaten').val();
				$.ajax({
					type : 'GET',
					url : 'inc/kecamatan.php',
					data :  'id_kabupaten=' + kab,
					success: function (data) {
						//jika data berhasil didapatkan, tampilkan ke dalam option select kabupaten
						$("#kecamatan").html(data);
						$("#kelurahan").html("<option value='0'>Pilih Kelurahan</option>");
					}
				});
		});

		$('#kecamatan').change(function(){
				//Mengambil value dari option select provinsi kemudian parameternya dikirim menggunakan ajax
				var desa = $('#kecamatan').val();
				$.ajax({
					type : 'GET',
					url : 'inc/kelurahan.php',
					data :  'id_kecamatan=' + desa,
					success: function (data) {
						//jika data berhasil didapatkan, tampilkan ke dalam option select kabupaten
						$("#kelurahan").html(data);
						// alert($('#provinsi option:selected').text() + $('#kabupaten option:selected').text() + $('#kecamatan option:selected').text() + $('#desa option:selected').text());
					}
				});
		});
</script>