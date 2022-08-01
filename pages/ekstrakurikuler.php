		<h2 class="content-heading">Data Ekstrakurikuler</h2>
		<div class="block block-rounded">
            <div class="block-content block-content-full">
              <div class="row mb-4">
					<div class="col-6">
						<input type="hidden" id="tapel" value="<?=$tapel;?>">
						<input type="hidden" id="smt" value="<?=$smt;?>">
						
						<?php if($level==11){ ?>
						<div class="row mb-2">
						  <label class="col-sm-4 col-form-label" for="example-hf-email">Rombel</label>
						  <div class="col-sm-8">
							<select class="form-select" id="kelas" name="kelas">
								<option value="0">Pilih Rombel</option>
								<?php 
								$sql4 = "select * from rombel where tapel='$tapel' and kurikulum='Kurikulum Merdeka' order by nama_rombel asc";
								$query4 = $connect->query($sql4);
								while($nk=$query4->fetch_assoc()){
									
								?>
								<option value="<?=$nk['nama_rombel'];?>"><?=$nk['nama_rombel'];?></option>
								<?php };?>
							</select>
						  </div>
						</div>
						
						<?php }else{ ?>
						<div class="row mb-2">
						  <label class="col-sm-4 col-form-label" for="example-hf-email">Rombel</label>
						  <div class="col-sm-8">
							<select class="form-select" id="kelas" name="kelas">
								<option value="0">Pilih Rombel</option>
								<option value="<?=$kelas;?>"><?=$kelas;?></option>
							</select>
						  </div>
						</div>
						
						<?php }; ?>
					</div>
				</div>
				<div id="nilaiHarian">
					<div class="alert alert-info alert-dismissible">
						<h4><i class="icon fa fa-info"></i> Informasi</h4>
						Silahkan Pilih Rombel
					</div>
				</div>
            </div>
        </div>
		
		<!-- Alternative Tabs in Modal -->
		<div class="modal" id="modalekskul" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="fetched-data"></div>
				</div>
			</div>
		</div>
          
          <!-- END Alternative Tabs in Modal -->
		