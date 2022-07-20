		<h2 class="content-heading">Rombel</h2>
		<div class="block block-rounded">
            <div class="block-header block-header-default">
              <h3 class="block-title">
                Kelas <small><?=$kelas;?></small>
              </h3>
			  <div class="block-options">
				<select class="form-select" id="kelas" name="kelas">
					<?php 
					if($level==11){
						$sql3 = "select * from rombel where tapel='$tapel' order by nama_rombel asc";
						$query3 = $connect->query($sql3);
						while($nk=$query3->fetch_assoc()){
					?>
					<option value="<?=$nk['nama_rombel'];?>">Kelas <?=$nk['nama_rombel'];?></option>
					<?php }
					}else{
					?>
					<option value="<?=$kelas;?>">Kelas <?=$kelas;?></option>
					<?php } ?>
				</select>
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
					<th>NIS</th>
					<th>NISN</th>
					<th>TTL</th>
					<th>JK</th>
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
          <div class="modal" id="modalsiswa" tabindex="-1" role="dialog" aria-labelledby="modal-tabs-alternative" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
              <div class="modal-content">
                <!-- Block Tabs Alternative Style -->
                <div class="fetched-data"></div>
				<!-- END Block Tabs Alternative Style -->
              </div>
            </div>
          </div>
          <!-- END Alternative Tabs in Modal -->
		