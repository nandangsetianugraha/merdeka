		<h2 class="content-heading">Lingkup Materi</h2>
		<div class="block block-rounded">
            <div class="block-content block-content-full">
              <div class="row mb-4">
					<div class="col-6">
						<input type="hidden" id="tapel" value="<?=$tapel;?>">
						<input type="hidden" id="smt" value="<?=$smt;?>">
						<?php if($level==96){?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="0">Pilih Rombel</option>
							<?php 
							$sql4 = "select * from rombel where tapel='$tapel' and pai='$idku' order by nama_rombel asc";
							$query4 = $connect->query($sql4);
							$ck=0;
							while($nk=$query4->fetch_assoc()){
								if(substr($nk['nama_rombel'],0,1)==$ck){}else{
									if(substr($nk['nama_rombel'],0,1)==1 or substr($nk['nama_rombel'],0,1)==4){
							?>
							<option value="<?=substr($nk['nama_rombel'],0,1);?>"><?=substr($nk['nama_rombel'],0,1);?></option>
							<?php 
								};};
								$ck=substr($nk['nama_rombel'],0,1);
							};							
							?>
						</select>
						<?php }elseif($level==95){ ?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="0">Pilih Rombel</option>
							<?php 
							$sql4 = "select * from rombel where tapel='$tapel' and penjas='$idku' order by nama_rombel asc";
							$query4 = $connect->query($sql4);
							$ck=0;
							while($nk=$query4->fetch_assoc()){
								if(substr($nk['nama_rombel'],0,1)==$ck){}else{
									if(substr($nk['nama_rombel'],0,1)==1 or substr($nk['nama_rombel'],0,1)==4){
							?>
							<option value="<?=substr($nk['nama_rombel'],0,1);?>"><?=substr($nk['nama_rombel'],0,1);?></option>
							<?php 
								};};
								$ck=substr($nk['nama_rombel'],0,1);
							};							
							?>
						</select>
						<?php }elseif($level==94){ ?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="0">Pilih Rombel</option>
							<?php 
							$sql4 = "select * from rombel where tapel='$tapel' and inggris='$idku' order by nama_rombel asc";
							$query4 = $connect->query($sql4);
							$ck=0;
							while($nk=$query4->fetch_assoc()){
								if(substr($nk['nama_rombel'],0,1)==$ck){}else{
									if(substr($nk['nama_rombel'],0,1)==1 or substr($nk['nama_rombel'],0,1)==4){
							?>
							<option value="<?=substr($nk['nama_rombel'],0,1);?>"><?=substr($nk['nama_rombel'],0,1);?></option>
							<?php 
								};};
								$ck=substr($nk['nama_rombel'],0,1);
							};							
							?>
						</select>
						<?php }elseif($level==11){ ?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="0">Pilih Rombel</option>
							<?php 
							$sql4 = "select * from rombel where tapel='$tapel' order by nama_rombel asc";
							$query4 = $connect->query($sql4);
							$ck=0;
							while($nk=$query4->fetch_assoc()){
								if(substr($nk['nama_rombel'],0,1)==$ck){}else{
									if(substr($nk['nama_rombel'],0,1)==1 or substr($nk['nama_rombel'],0,1)==4){
							?>
							<option value="<?=substr($nk['nama_rombel'],0,1);?>"><?=substr($nk['nama_rombel'],0,1);?></option>
							<?php 
								};};
								$ck=substr($nk['nama_rombel'],0,1);
							};							
							?>
						</select>
						<?php }else{ ?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="0">Pilih Rombel</option>
							<option value="<?=$ab;?>"><?=$ab;?></option>
						</select>
						<?php }; ?>
					</div>
					<div class="col-6">
						<label class="form-label" for="example-text-input">Mapel</label>
						<select class="form-select" id="mp" name="mp">
							
						</select>
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
		<div class="modal" id="modalmateri" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form class="form-horizontal" action="modul/materi/tambahmateri.php" autocomplete="off" method="POST" id="buatmateri">
						<div class="fetched-data"></div>
					</form>
				</div>
			</div>
		</div>
          
          <!-- END Alternative Tabs in Modal -->
		