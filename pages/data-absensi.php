		<h2 class="content-heading">Data Absensi Kelas <?=$kelas;?></h2>
		<div class="block block-rounded">
            <div class="block-content block-content-full">
              <div class="row mb-4">
					<div class="col-4">
						<label class="form-label" for="example-text-input">Tanggal</label>
						<input type="text" class="js-flatpickr form-control" id="tglabsen" name="tglabsen" value="<?=date('Y-m-d');?>">
					</div>
					<div class="col-4">
						<input type="hidden" id="tapel" value="<?=$tapel;?>">
						<input type="hidden" id="smt" value="<?=$smt;?>">
						
						<?php if($level==11){ ?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<?php 
							$sql4 = "select * from rombel where tapel='$tapel' and kurikulum='Kurikulum Merdeka' order by nama_rombel asc";
							$query4 = $connect->query($sql4);
							while($nk=$query4->fetch_assoc()){
								
							?>
							<option value="<?=$nk['nama_rombel'];?>"><?=$nk['nama_rombel'];?></option>
							<?php };?>
						</select>
						<?php }else{ ?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="<?=$kelas;?>"><?=$kelas;?></option>
						</select>
						<?php }; ?>
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-12 col-xl-12">
						<table class="table table-bordered table-striped table-vcenter js-dataTable-responsive" id="manageMemberTable">
							<thead>
								<tr>
									<th class="text-center">Nama Siswa</th>
									<th class="text-center">Sakit</th>
									<th class="text-center">Ijin</th>
									<th class="text-center">Tanpa Keterangan</th>
									<th class="text-center"></th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
            </div>
        </div>
		
		<!-- Alternative Tabs in Modal -->
		<div class="modal" id="syncabsen" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="fetched-data"></div>
				</div>
			</div>
		</div>
		
		<div class="modal" id="editabsen" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="fetched-data1"></div>
				</div>
			</div>
		</div>
          
          <!-- END Alternative Tabs in Modal -->
		