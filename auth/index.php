<?php 
session_start();
include '../inc/versi.php';
include '../inc/config.php'; 
include '../inc/db_connect.php';
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <title>Login <?=$apps['nama'];?></title>

    <meta name="description" content="APINS - Aplikasi Penilaian dan Informasi Nilai Siswa">
    <meta name="author" content="">
    <meta name="robots" content="noindex, nofollow">

    <!-- Open Graph Meta -->
    <meta property="og:title" content="APINS - Aplikasi Penilaian dan Informasi Nilai Siswa">
    <meta property="og:site_name" content="APINS">
    <meta property="og:description" content="APINS - Aplikasi Penilaian dan Informasi Nilai Siswa">
    <meta property="og:type" content="website">
    <meta property="og:url" content="">
    <meta property="og:image" content="">

    <!-- Icons -->
    <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
    <link rel="shortcut icon" href="<?=base_url();?>assets/media/favicons/favicon.png">
    <link rel="icon" type="image/png" sizes="192x192" href="<?=base_url();?>assets/media/favicons/favicon-192x192.png">
    <link rel="apple-touch-icon" sizes="180x180" href="<?=base_url();?>assets/media/favicons/apple-touch-icon-180x180.png">
    <!-- END Icons -->

    <!-- Stylesheets -->

    <!-- Fonts and Codebase framework -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap">
    <link rel="stylesheet" id="css-main" href="<?=base_url();?>assets/css/codebase.min.css">

    <!-- You can include a specific file from css/themes/ folder to alter the default color theme of the template. eg: -->
    <!-- <link rel="stylesheet" id="css-theme" href="assets/css/themes/flat.min.css"> -->
    <!-- END Stylesheets -->
  </head>
  <body>
	<div id="page-loader" class="show"></div>
    <!-- Page Container -->
    <div id="page-container" class="main-content-boxed">

      <!-- Main Container -->
      <main id="main-container">
        <!-- Page Content -->
        <div class="bg-image" style="background-image: url('<?=base_url();?>assets/media/photos/photo34@2x.jpg');">
          <div class="row mx-0 bg-black-50">
            <div class="hero-static col-md-6 col-xl-8 d-none d-md-flex align-items-md-end">
              <div class="p-4">
                <p class="fs-3 fw-semibold text-white">
                  <?=$apps['nama'];?> <?=$apps['versi'];?>
                </p>
                <p class="text-white-75 fw-medium">
                  Copyright &copy; <span data-toggle="year-copy"></span> SD Islam Al-Jannah
                </p>
              </div>
            </div>
            <div class="hero-static col-md-6 col-xl-4 d-flex align-items-center bg-body-extra-light">
              <div class="content content-full">
                <!-- Header -->
                <div class="px-4 py-2 mb-4">
                  <a class="link-fx fw-bold" href="index.html">
                    <i class="fa fa-fire"></i>
                    <span class="fs-4 text-body-color">AP</span><span class="fs-4">INS</span>
                  </a>
                  <h1 class="h3 fw-bold mt-4 mb-2">Selamat Datang</h1>
                  <h2 class="h5 fw-medium text-muted mb-0">Silahkan masuk</h2>
                </div>
                <!-- END Header -->

                <!-- Sign In Form -->
                <!-- jQuery Validation functionality is initialized with .js-validation-signin class in js/pages/op_auth_signin.min.js which was auto compiled from _js/pages/op_auth_signin.js -->
                <!-- For more examples you can check out https://github.com/jzaefferer/jquery-validation -->
				
                <form class="js-validation-signin px-4" method="post">
				<div id="errors-wrap"></div>
				<div id="login-form">
                  <div class="form-floating mb-4">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username">
                    <label class="form-label" for="login-username">Username</label>
                  </div>
                  <div class="form-floating mb-4">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password">
                    <label class="form-label" for="login-password">Password</label>
                  </div>
				  <div class="form-group row">
										<div class="col-6">
											<div class="form-floating">
												<select class="form-control" id="tapel" name="tapel">
													<?php 
													$tapels = $connect->query("SELECT * FROM tapel");
													//$cfg=$cekconfig->fetch_assoc();
													while($t=$tapels->fetch_assoc()){
													?>
													<option value="<?=$t['nama_tapel']?>" <?php if($t['nama_tapel']==$tapel_aktif){echo "selected";} ?>><?=$t['nama_tapel'];?></option>
													<?php } ?>
												</select>
												<label for="material-select">Tahun Ajaran</label>
											</div>
										</div>
										<div class="col-6">
											<div class="form-floating">
												<select class="form-control" id="smt" name="smt">
													<option value="1" <?php if($smt_aktif==1){echo "selected";} ?>>Semester 1</option>
													<option value="2" <?php if($smt_aktif==2){echo "selected";} ?>>Semester 2</option>
												</select>
												<label for="material-select">Semester</label>
											</div>
										</div>
									</div>
                  <div class="mb-4">
					
                  </div>
                  <div class="mb-4">
                    <button type="submit" id="submit" class="btn btn-lg btn-alt-primary fw-semibold">Masuk</button>
					<a href="../../" class="btn btn-lg btn-alt-primary fw-semibold">Kembali</a>
                  </div>
				  
				 </div>
                </form>
                <!-- END Sign In Form -->
              </div>
            </div>
          </div>
        </div>
        <!-- END Page Content -->
      </main>
      <!-- END Main Container -->
    </div>
    <!-- END Page Container -->

    <!--
        Codebase JS

        Core libraries and functionality
        webpack is putting everything together at assets/_js/main/app.js
    -->
    <script src="<?=base_url(); ?>assets/js/codebase.app.min.js"></script>

    <!-- jQuery (required for Select2 + jQuery Validation plugins) -->
    <script src="<?=base_url(); ?>assets/js/lib/jquery.min.js"></script>

    <!-- Page JS Plugins -->
    <script src="<?=base_url(); ?>assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>

    <!-- Page JS Code -->
    <script src="<?=base_url(); ?>assets/js/pages/op_auth_signin.min.js"></script>
	<script src="<?=base_url(); ?>auth/login.js"></script>
  </body>
</html>