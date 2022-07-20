		<h2 class="content-heading">Sumatif Akhir Semester</h2>
		<div class="block block-rounded">
            <div class="block-content block-content-full">
              <div class="row mb-4">
					<div class="col-3">
						<input type="hidden" id="tapel" value="<?=$tapel;?>">
						<input type="hidden" id="smt" value="<?=$smt;?>">
						<?php if($level==96){?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="0">Pilih Rombel</option>
							<?php 
							$sql4 = "select * from rombel where tapel='$tapel' and pai='$idku' order by nama_rombel asc";
							$query4 = $connect->query($sql4);
							while($nk=$query4->fetch_assoc()){
								if(substr($nk['nama_rombel'],0,1)==1 or substr($nk['nama_rombel'],0,1)==4){
							?>
							<option value="<?=$nk['nama_rombel'];?>"><?=$nk['nama_rombel'];?></option>
							<?php }};?>
						</select>
						<?php }elseif($level==95){ ?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="0">Pilih Rombel</option>
							<?php 
							$sql4 = "select * from rombel where tapel='$tapel' and penjas='$idku' order by nama_rombel asc";
							$query4 = $connect->query($sql4);
							while($nk=$query4->fetch_assoc()){
								if(substr($nk['nama_rombel'],0,1)==1 or substr($nk['nama_rombel'],0,1)==4){
							?>
							<option value="<?=$nk['nama_rombel'];?>"><?=$nk['nama_rombel'];?></option>
							<?php }};?>
						</select>
						<?php }elseif($level==94){ ?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="0">Pilih Rombel</option>
							<?php 
							$sql4 = "select * from rombel where tapel='$tapel' and inggris='$idku' order by nama_rombel asc";
							$query4 = $connect->query($sql4);
							while($nk=$query4->fetch_assoc()){
								if(substr($nk['nama_rombel'],0,1)==1 or substr($nk['nama_rombel'],0,1)==4){
							?>
							<option value="<?=$nk['nama_rombel'];?>"><?=$nk['nama_rombel'];?></option>
							<?php }};?>
						</select>
						<?php }elseif($level==11){ ?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="0">Pilih Rombel</option>
							<?php 
							$sql4 = "select * from rombel where tapel='$tapel' order by nama_rombel asc";
							$query4 = $connect->query($sql4);
							while($nk=$query4->fetch_assoc()){
								if(substr($nk['nama_rombel'],0,1)==1 or substr($nk['nama_rombel'],0,1)==4){
							?>
							<option value="<?=$nk['nama_rombel'];?>"><?=$nk['nama_rombel'];?></option>
							<?php }};?>
						</select>
						<?php }else{ ?>
						<label class="form-label" for="example-text-input">Kelas</label>
						<select class="form-select" id="kelas" name="kelas">
							<option value="0">Pilih Rombel</option>
							<option value="<?=$kelas;?>"><?=$kelas;?></option>
						</select>
						<?php }; ?>
					</div>
					<div class="col-4">
						<label class="form-label" for="example-text-input">Mapel</label>
						<select class="form-select" id="mp" name="mp">
							
						</select>
					</div>
				</div>
				<div id="nilaiHarian">
					<div class="alert alert-info alert-dismissible">
						<h4><i class="icon fa fa-info"></i> Informasi</h4>
						Silahkan Pilih Mata Pelajaran
					</div>
				</div>
            </div>
        </div>
		<!-- Alternative Tabs in Modal -->
		
          <!-- END Alternative Tabs in Modal -->
		