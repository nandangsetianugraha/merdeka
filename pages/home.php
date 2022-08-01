<?php 
require_once 'inc/Json.class.php'; 
$db = new Json();
$versi = $db->getRows();
?>

		  <!-- User Info -->
			<div class="bg-image bg-image-bottom" style="background-image: url('assets/media/photos/photo13@2x.jpg');">
			  <div class="bg-primary-dark-op py-4">
				<div class="content content-full text-center">
				  <!-- Avatar -->
				  <div class="mb-3">
					<a class="img-link" href="<?=base_url();?>profil">
					  <img class="img-avatar img-avatar96 img-avatar-thumb" src="<?=$avatar;?>" alt="">
					</a>
				  </div>
				  <!-- END Avatar -->

				  <!-- Personal -->
				  <h1 class="h3 text-white fw-bold mb-2">
					<?=$bioku['nama'];?>
				  </h1>
				  <h2 class="h5 fw-medium text-white-75">
					<a class="text-primary-light" href="javascript:void(0)"><?=$jns_ptk['jenis_ptk'];?></a>
				  </h2>
				  <!-- END Personal -->

				  <!-- Actions -->
				  <button type="button" class="btn btn-primary me-1">
					<i class="fa fa-fw fa-envelope opacity-50 me-1"></i> Message
				  </button>
				  <a class="btn btn-alt-primary" href="<?=base_url();?>profil">
					<i class="fa fa-fw fa-pencil-alt opacity-50 mb-1"></i> Edit
				  </a>
				  <!-- END Actions -->
				</div>
			  </div>
			</div>
			<br/>
			<!-- END User Info -->
			<?php if($level==98 or $level==97 or $level==11){ ?>
		  <div class="row">
            <!-- Row #1 -->
            <div class="col-6 col-xl-3">
              <a class="block block-rounded block-bordered block-link-shadow" href="javascript:void(0)">
                <div class="block-content block-content-full d-sm-flex justify-content-between align-items-center">
                  <div class="d-none d-sm-block">
                    <i class="si si-users fa-2x text-primary-light"></i>
                  </div>
                  <div class="text-end">
                    <div class="fs-3 fw-semibold text-primary"><?=$laki+$wanita;?></div>
                    <div class="fs-sm fw-semibold text-uppercase text-muted">Jumlah Siswa</div>
                  </div>
                </div>
              </a>
            </div>
            <div class="col-6 col-xl-3">
              <a class="block block-rounded block-bordered block-link-shadow" href="javascript:void(0)">
                <div class="block-content block-content-full d-sm-flex justify-content-between align-items-center">
                  <div class="d-none d-sm-block">
                    <i class="si si-user fa-2x text-earth-light"></i>
                  </div>
                  <div class="text-end">
                    <div class="fs-3 fw-semibold text-earth"><?=$laki;?></div>
                    <div class="fs-sm fw-semibold text-uppercase text-muted">Laki-laki</div>
                  </div>
                </div>
              </a>
            </div>
            <div class="col-6 col-xl-3">
              <a class="block block-rounded block-bordered block-link-shadow" href="javascript:void(0)">
                <div class="block-content block-content-full d-sm-flex justify-content-between align-items-center">
                  <div class="d-none d-sm-block">
                    <i class="si si-user-female fa-2x text-elegance-light"></i>
                  </div>
                  <div class="text-end">
                    <div class="fs-3 fw-semibold text-elegance"><?=$wanita;?></div>
                    <div class="fs-sm fw-semibold text-uppercase text-muted">Perempuan</div>
                  </div>
                </div>
              </a>
            </div>
            <div class="col-6 col-xl-3">
              <a class="block block-rounded block-bordered block-link-shadow" href="javascript:void(0)">
                <div class="block-content block-content-full d-sm-flex justify-content-between align-items-center">
                  <div class="d-none d-sm-block">
                    <i class="si si-users fa-2x text-pulse"></i>
                  </div>
                  <div class="text-end">
                    <div class="fs-3 fw-semibold text-pulse">23</div>
                    <div class="fs-sm fw-semibold text-uppercase text-muted">PTK</div>
                  </div>
                </div>
              </a>
            </div>
            <!-- END Row #1 -->
          </div>
		  <?php } ?>
          <div class="row">
            <!-- Row #3 -->
            <div class="col-md-6">
				<!--
				<div class="block block-rounded">
					<div class="block-header block-header-default">
					  <h3 class="block-title">
						<i class="fa fa-share-alt me-1 text-muted"></i> Pemberitahuan
					  </h3>
					</div>
					<div class="block-content">
						<div class="row items-push">
						  <div class="col-lg-1">
							<p class="text-muted">
							  <img class="img-avatar" src="<?=$avatar;?>" alt="">
							</p>
						  </div>
						  <div class="col-lg-11">
						  </div>
						</div>
					</div>
				</div> 
				-->
				<div class="block block-rounded">
					<div class="block-header block-header-default">
					  <h3 class="block-title">
						<i class="fa fa-share-alt me-1 text-muted"></i> Aktivitas Terakhir
					  </h3>
					</div>
					<div class="block-content">
						<div class="row items-push">
						  <div class="col-lg-2">
							<p class="text-muted">
							  <img class="img-avatar" src="<?=$avatar;?>" alt="">
							</p>
						  </div>
						  <div class="col-lg-10">
							<div id="screen"></div>
						  </div>
						</div>
					</div>
				</div>
            </div>
            <div class="col-md-6">
				<div class="block block-rounded">
					<div class="block-header block-header-default">
					  <h3 class="block-title">
						<i class="fa fa-share-alt me-1 text-muted"></i> Pengumuman
					  </h3>
					</div>
					<div class="block-content">
						<div class="row items-push">
						  <div class="col-lg-12">
							<ul class="list list-activity">
								<?php if(!empty($versi)){ $count = 0; foreach($versi as $row){ $count++; ?>
								<li class="timeline-event">
								  <!--<img class="img-avatar" src="<?=$avatar;?>" alt="">-->
								  <i class="si si-user-follow text-success"></i>
								  <div class="fw-semibold"><?=$row['versi']; ?></div>
								  <div>
									<a class="fs-sm" href="javascript:void(0)"><?=$row['deskripsi']; ?></a>
								  </div>
								  <div class="fs-xs text-muted"><?=$row['tanggal']; ?></div>
								</li>
								<?php } }else{ ?>
								<li class="timeline-event">
								  <!--<img class="img-avatar" src="<?=$avadmin;?>" alt="">-->
								  <i class="si si-user-follow text-success"></i>
								  <div class="fw-semibold">Tidak ada update terbaru</div>
								  <div>
									<a class="fs-sm" href="javascript:void(0)">Tidak ada update terbaru</a>
								  </div>
								  <div class="fs-xs text-muted">Now</div>
								</li>
								<?php } ?>
							</ul>
						  </div>
						</div>
					</div>
				</div>
			</div>
            <!-- END Row #3 -->
          </div>
        