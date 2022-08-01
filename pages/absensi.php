		<h2 class="content-heading">Absensi Kelas <?=$kelas;?></h2>
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
					<div class="col-4">
						<label class="form-label" for="example-text-input">Cetak</label><br/>
						<button class="btn btn-primary mr-1" type="button" id="getAbsensi">Cetak</button>
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-6 col-xl-6">
						<table class="table table-bordered table-striped table-vcenter js-dataTable-responsive" id="absenTable">
							<thead>
								<tr>
									<th></th>
									<th>Nama Siswa</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
					<div class="col-md-6 col-xl-6">
						<div class="row g-sm">
							<div class="col-4 col-md-4 col-xl-4">
							  <a class="block block-transparent text-center bg-primary" href="javascript:void(0)">
								<div class="block-content">
								  <p class="fs-1 text-white">
									<strong><div id="sakit">0</div></strong>
								  </p>
								  <p class="fw-semibold text-white-75">
									Sakit
								  </p>
								</div>
							  </a>
							</div>
							<div class="col-4 col-md-4 col-xl-4">
							  <a class="block block-transparent text-center bg-success" href="javascript:void(0)">
								<div class="block-content">
								  <p class="fs-1 text-white">
									<strong><div id="ijin">0</div></strong>
								  </p>
								  <p class="fw-semibold text-white-75">
									Ijin
								  </p>
								</div>
							  </a>
							</div>
							<div class="col-4 col-md-4 col-xl-4">
							  <a class="block block-transparent text-center bg-gd-sun" href="javascript:void(0)">
								<div class="block-content">
								  <p class="fs-1 text-white">
									<strong><div id="alfa">0</div></strong>
								  </p>
								  <p class="fw-semibold text-white-75">
									Alfa
								  </p>
								</div>
							  </a>
							</div>
						</div>
						<table class="table table-bordered table-striped table-vcenter js-dataTable-responsive" id="dataabsen">
							<thead>
								<tr>
									<th>Nama Siswa</th>
									<th>Absensi</th>
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
		<div class="modal" id="tambahAbsen" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="fetched-data"></div>
				</div>
			</div>
		</div>
          
          <!-- END Alternative Tabs in Modal -->
		