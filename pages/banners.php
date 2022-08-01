							<?php
							session_start();
							$idku=$_SESSION['userid'];
							$tapel = $_SESSION['tapel'];
							$smt = $_SESSION['smt'];
							$level = $_SESSION['level'];
							include "../inc/db_connect.php";							
							if($level==11){
								$sql3 = "select * from log order by logDate desc limit 5";
							}else{
								$sql3 = "select * from log where ptk_id='$idku' order by logDate desc limit 5";
							};
							$query3 = $connect->query($sql3);
							$adaact=$query3->num_rows;
							if($adaact>0){
							?>
							<ul class="list list-activity">
								<?php
								while($nk=$query3->fetch_assoc()){
									$ptk_id=$nk['ptk_id'];
									$namaadmin=$connect->query("select * from ptk where ptk_id='$ptk_id'")->fetch_assoc();
								?>
								<li class="timeline-event">
								  <i class="si si-user-follow text-success"></i>
								  <div class="fw-semibold"><?=$namaadmin['nama'];?></div>
								  <div>
									<a class="fs-sm" href="javascript:void(0)"><?=$nk['activity'];?></a>
								  </div>
								  <div class="fs-xs text-muted"><?=$nk['logDate'];?></div>
								</li>
								<?php } ?>
							</ul>
							<?php
							}else{
							?>
							<ul class="list list-activity">
								<li class="timeline-event">
								  <i class="si si-user-follow text-warning"></i>
								  <div class="fw-semibold">Belum Ada Aktivitas</div>
								  <div>
									<a class="fs-sm" href="javascript:void(0)">Admin Template</a>
								  </div>
								  <div class="fs-xs text-muted">5 min ago</div>
								</li>
							</ul>
							<?php 
							};
							?>