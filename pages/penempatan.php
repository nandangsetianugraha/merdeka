		<h2 class="content-heading">Penempatan Siswa</h2>
		<div class="row">
			<div class="col-6 col-xl-6">
				<div class="block block-rounded">
					<div class="block-header block-header-default">
					  <h3 class="block-title">
						Siswa yang belum <small>Dimapping</small>
					  </h3>
					</div>
					<div class="block-content block-content-full">
					  <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _js/pages/be_tables_datatables.js -->
					  <input type="hidden" name="tapel" id="tapel" class="form-control" value="<?=$tapel;?>">
					  <input type="hidden" name="smt" id="smt" class="form-control" value="<?=$smt;?>">
					  <table class="table table-bordered table-striped table-vcenter js-dataTable-full" id="manageSiswa">
						<thead>
						  <tr>
							<th class="text-center">Nama</th>
							<th>Kelas</th>
							<th class="d-none d-sm-table-cell"></th>
						  </tr>
						</thead>
						<tbody>
						  
						</tbody>
					  </table>
					</div>
				</div>
			</div>
			<div class="col-6 col-xl-6">
				<div class="block block-rounded">
					<div class="block-header block-header-default">
					  <h3 class="block-title">
						Rombel
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
					  <table class="table table-bordered table-striped table-vcenter js-dataTable-full" id="managePenempatan">
						<thead>
						  <tr>
							<th class="text-center">Nama</th>
							<th class="d-none d-sm-table-cell"></th>
						  </tr>
						</thead>
						<tbody>
						  
						</tbody>
					  </table>
					</div>
				</div>
			</div>
		</div>
		  <div class="modal" id="penempatanMemberModal" tabindex="-1" role="dialog" aria-labelledby="modal-tabs-alternative" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <!-- Block Tabs Alternative Style -->
                <div class="block block-rounded">
					<div class="block-header block-header-default">
					  <h3 class="block-title">
						<i class="fa fa-share-alt me-1 text-muted"></i> Penempatan Siswa
					  </h3>
					</div>
					<form class="form" action="modul/siswa/penempatansiswa.php" method="POST" id="penempatanMemberForm">
					<div class="block-content">
					
						
					</div>
					<div class="block-content block-content-full block-content-sm text-end border-top">
						<button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">
							Tutup
						</button>
						<button type="submit" class="btn btn-alt-primary">
						    Tempatkan
						</button>
					</div>
					</form>
				  </div>
				<!-- END Block Tabs Alternative Style -->
              </div>
            </div>
          </div>
		