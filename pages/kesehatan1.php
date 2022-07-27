		<h2 class="content-heading">Data Kesehatan</h2>
		<div class="block block-rounded">
            <div class="block-header block-header-default">
              <h3 class="block-title">
                Kelas <small><?=$kelas;?></small>
              </h3>
			  <div class="block-options">
				<?php if($level==11){ ?>
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
				<select class="form-select" id="kelas" name="kelas">
					<option value="0">Pilih Rombel</option>
					<option value="<?=$kelas;?>"><?=$kelas;?></option>
				</select>
				<?php }; ?>
			  </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _js/pages/be_tables_datatables.js -->
			  <input type="hidden" name="tapel" id="tapel" class="form-control" value="<?=$tapel;?>">
			  <input type="hidden" name="smt" id="smt" class="form-control" value="<?=$smt;?>">
              <table class="table table-bordered table-striped table-vcenter js-dataTable-full" id="manageMemberTable">
                <thead>
                  <tr>
                    <th>Nama Siswa</th>
					<th>Tinggi (cm)</th>
					<th>Berat (Kg)</th>
					<th>Pendengaran</th>
					<th>Penglihatan</th>
					<th>Gigi</th>
					<th>Lainnya</th>
					<th class="d-none d-sm-table-cell"></th>
                  </tr>
                </thead>
                <tbody>
                  
                </tbody>
              </table>
            </div>
        </div>
		<!-- Alternative Tabs in Modal -->
		<!-- Alternative Tabs in Modal -->
          <div class="modal" id="modalkesehatan" tabindex="-1" role="dialog" aria-labelledby="modal-tabs-alternative" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
              <div class="modal-content">
                <!-- Block Tabs Alternative Style -->
				
                <div class="fetched-data"></div>
				<!-- END Block Tabs Alternative Style -->
              </div>
            </div>
          </div>
          <!-- END Alternative Tabs in Modal -->
		