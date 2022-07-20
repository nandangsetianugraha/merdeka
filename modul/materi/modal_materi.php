<?php 
require_once '../../inc/db_connect.php';
$kelas=$_POST['kelas'];
$smt=$_POST['smt'];
$mp=$_POST['mp'];
$mapel=$connect->query("select * from mata_pelajaran where id_mapel='$mp'")->fetch_assoc();
?>
				<div class="block block-rounded shadow-none mb-0">
                  <div class="block-header block-header-default">
                    <h3 class="block-title">Materi <?=$mapel['nama_mapel'];?> Kelas <?=$kelas;?></h3>
                    <div class="block-options">
                      <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa fa-times"></i>
                      </button>
                    </div>
                  </div>
                  <div class="block-content fs-sm">
                    <div class="mb-4">
                      <label class="form-label" for="example-text-input">Materi</label>
					  <input type="hidden" class="form-control" id="kelas" name="kelas" value="<?=$kelas;?>">
					  <input type="hidden" class="form-control" id="smt" name="smt" value="<?=$smt;?>">
					  <input type="hidden" class="form-control" id="mp" name="mp" value="<?=$mp;?>">
					  <input type="text" class="form-control" id="no_lm" name="no_lm" placeholder="Nomor Materi">
                    </div>
					<div class="mb-4">
                      <label class="form-label" for="example-text-input">Lingkup Materi</label>
                      <input type="text" class="form-control" id="materi" name="materi" placeholder="Lingkup Materi">
                    </div>
                  </div>
                  <div class="block-content block-content-full block-content-sm text-end border-top">
                    <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-alt-primary">Simpan</button>
                  </div>
                </div>