<?php 
require_once '../../inc/db_connect.php';
$kelas=$_POST['kelas'];
$ab=substr($kelas,0,1);
$smt=$_POST['smt'];
$mp=$_POST['mp'];
$materi=$_POST['lm'];
$mapel=$connect->query("select * from mata_pelajaran where id_mapel='$mp'")->fetch_assoc();
$nama_materi=$connect->query("select * from lingkup_materi where kelas='$kelas' and smt='$smt' and mapel='$mp' and lm='$materi'")->fetch_assoc();
?>
					<div class="block block-rounded shadow-none mb-0">
					  <div class="block-header block-header-default">
						<h3 class="block-title">Tujuan Pembelajaran <?=$mapel['nama_mapel'];?> Kelas <?=$ab;?></h3>
						<div class="block-options">
						  <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
							<i class="fa fa-times"></i>
						  </button>
						</div>
					  </div>
					  <div class="block-content fs-sm">
						<div class="mb-4">
						  <label class="form-label" for="example-text-input">Lingkup Materi</label>
						  <input type="text" class="form-control" value="<?=$nama_materi['nama_lm'];?>" readonly="true">
						</div>
						<div class="mb-4">
						  <label class="form-label" for="example-text-input">Kode TP</label>
						  <input type="hidden" class="form-control" id="kelas" name="kelas" value="<?=$ab;?>">
						  <input type="hidden" class="form-control" id="smt" name="smt" value="<?=$smt;?>">
						  <input type="hidden" class="form-control" id="mp" name="mp" value="<?=$mp;?>">
						  <input type="hidden" class="form-control" id="materi" name="materi" value="<?=$materi;?>">
						  <input type="text" class="form-control" id="kode_tp" name="kode_tp" placeholder="Kode TP" value="<?=$ab;?>.">
						</div>
						<div class="mb-4">
						  <label class="form-label" for="example-text-input">Tujuan Pembelajaran</label>
						  <input type="text" class="form-control" id="tp" name="tp" placeholder="Tujuan Pembelajaran">
						</div>
					  </div>
					  <div class="block-content block-content-full block-content-sm text-end border-top">
						<button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-alt-primary">Simpan</button>
					  </div>
					</div>