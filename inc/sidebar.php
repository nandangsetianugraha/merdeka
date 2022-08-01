	  <nav id="sidebar">
        <!-- Sidebar Content -->
        <div class="sidebar-content">
          <!-- Side Header -->
          <div class="content-header justify-content-lg-center">
            <!-- Logo -->
            <div>
              <span class="smini-visible fw-bold tracking-wide fs-lg">
                A<span class="text-primary">P</span>
              </span>
              <a class="link-fx fw-bold tracking-wide mx-auto" href="./">
                <span class="smini-hidden">
                  <i class="fa fa-fire text-primary"></i>
                  <span class="fs-4 text-dual">APINS</span> <span class="fs-4 text-primary">Merdeka</span>
                </span>
              </a>
            </div>
            <!-- END Logo -->

            <!-- Options -->
            <div>
              <!-- Close Sidebar, Visible only on mobile screens -->
              <!-- Layout API, functionality initialized in Template._uiApiLayout() -->
              <button type="button" class="btn btn-sm btn-alt-danger d-lg-none" data-toggle="layout" data-action="sidebar_close">
                <i class="fa fa-fw fa-times"></i>
              </button>
              <!-- END Close Sidebar -->
            </div>
            <!-- END Options -->
          </div>
          <!-- END Side Header -->

          <!-- Sidebar Scrolling -->
          <div class="js-sidebar-scroll">
            <!-- Side User -->
            <div class="content-side content-side-user px-0 py-0">
              <!-- Visible only in mini mode -->
              <div class="smini-visible-block animated fadeIn px-3">
                <img class="img-avatar img-avatar32" src="<?=$avatar;?>" alt="">
              </div>
              <!-- END Visible only in mini mode -->

              <!-- Visible only in normal mode -->
              <div class="smini-hidden text-center mx-auto">
                <a class="img-link" href="./">
                  <img class="img-avatar" src="<?=$avatar;?>" alt="">
                </a>
                <ul class="list-inline mt-3 mb-0">
                  <li class="list-inline-item">
                    <?=$namany[0];?>
                  </li>
                  <li class="list-inline-item">
                    <!-- Layout API, functionality initialized in Template._uiApiLayout() -->
                    <a class="link-fx text-dual" data-toggle="layout" data-action="dark_mode_toggle" href="javascript:void(0)">
                      <i class="fa fa-burn"></i>
                    </a>
                  </li>
                  <li class="list-inline-item">
                    <a class="link-fx text-dual" href="<?=base_url();?>logout.php">
                      <i class="fa fa-sign-out-alt"></i>
                    </a>
                  </li>
                </ul>
              </div>
              <!-- END Visible only in normal mode -->
            </div>
            <!-- END Side User -->

            <!-- Side Navigation -->
            <div class="content-side content-side-full">
              <ul class="nav-main">
                <li class="nav-main-item">
                  <a class="nav-main-link" href="<?=base_url();?>">
                    <i class="nav-main-link-icon fa fa-house-user"></i>
                    <span class="nav-main-link-name">Beranda</span>
                  </a>
                </li>
                <li class="nav-main-item">
                  <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="true" href="#">
                    <i class="nav-main-link-icon fa fa-award"></i>
                    <span class="nav-main-link-name">Siswa</span>
                  </a>
                  <ul class="nav-main-submenu">
                    <li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>rombel">
                        <span class="nav-main-link-name">Kelasku</span>
                      </a>
                    </li>
					<?php if($level==11){ ?>
					<li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>penempatan">
                        <span class="nav-main-link-name">Penempatan</span>
                      </a>
                    </li>
					<?php } ?>
                    <li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>absensi">
                        <span class="nav-main-link-name">Absensi</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="nav-main-heading">Kurikulum Merdeka</li>
                <li class="nav-main-item">
                  <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                    <i class="nav-main-link-icon fa fa-grip-vertical"></i>
                    <span class="nav-main-link-name">Administrasi Kelas</span>
                  </a>
                  <ul class="nav-main-submenu">
					<li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>lm">
                        <span class="nav-main-link-name">Lingkup Materi</span>
                      </a>
                    </li>
                    <li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>tp">
                        <span class="nav-main-link-name">Tujuan Pembelajaran</span>
                      </a>
                    </li>
                  </ul>
                </li>
				<li class="nav-main-item">
                  <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                    <i class="nav-main-link-icon fa fa-pencil-ruler"></i>
                    <span class="nav-main-link-name">Penilaian Harian</span>
                  </a>
                  <ul class="nav-main-submenu">
                    <li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>formatif">
                        <span class="nav-main-link-name">Formatif</span>
                      </a>
                    </li>
					<li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>sumatif">
                        <span class="nav-main-link-name">Sumatif</span>
                      </a>
                    </li>
                  </ul>
                </li>
				<li class="nav-main-item">
                  <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                    <i class="nav-main-link-icon fa fa-edit"></i>
                    <span class="nav-main-link-name">Sumatif Semester</span>
                  </a>
                  <ul class="nav-main-submenu">
                    <li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>sts">
                        <span class="nav-main-link-name">Sumatif Tengah Semester</span>
                      </a>
                    </li>
					<li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>sas">
                        <span class="nav-main-link-name">Sumatif Akhir Semester</span>
                      </a>
                    </li>
                  </ul>
                </li>
				<?php if ($level==98 or $level==97 or $level==11) { ?>
				<li class="nav-main-item">
                  <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                    <i class="nav-main-link-icon fa fa-list-alt"></i>
                    <span class="nav-main-link-name">Data Isian Semester</span>
                  </a>
                  <ul class="nav-main-submenu">
                    <li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>kesehatan">
                        <span class="nav-main-link-name">Kesehatan</span>
                      </a>
                    </li>
					<li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>data-absensi">
                        <span class="nav-main-link-name">Data Absensi</span>
                      </a>
                    </li>
					<li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>ekstrakurikuler">
                        <span class="nav-main-link-name">Ekstrakurikuler</span>
                      </a>
                    </li>
                  </ul>
                </li>
				<?php } ?>
				<li class="nav-main-heading">Rapor</li>
                <li class="nav-main-item">
                  <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                    <i class="nav-main-link-icon fa fa-coffee"></i>
                    <span class="nav-main-link-name">Rapor</span>
                  </a>
                  <ul class="nav-main-submenu">
                    <li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>generate-rapor">
                        <span class="nav-main-link-name">Generate Rapor</span>
                      </a>
                    </li>
					<?php if($level==11 or $level==98 or $level==97){ ?>
                    <li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>cetak-rapor">
                        <span class="nav-main-link-name">Cetak Rapor</span>
                      </a>
                    </li>
					<li class="nav-main-item">
                      <a class="nav-main-link" href="<?=base_url();?>rekap-rapor">
                        <span class="nav-main-link-name">Rekapitulasi Rapor</span>
                      </a>
                    </li>
					<?php } ?>
                  </ul>
                </li>
              </ul>
            </div>
            <!-- END Side Navigation -->
          </div>
          <!-- END Sidebar Scrolling -->
        </div>
        <!-- Sidebar Content -->
      </nav>
      