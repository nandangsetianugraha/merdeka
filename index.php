<?php 
session_start();
$request  = $_SERVER['REQUEST_URI'];
$params     = explode("/", $request);
include 'inc/versi.php';
include 'inc/config.php'; 
include 'inc/db_connect.php';
if (!isset($_SESSION['level'])) {
    header("location:./auth/");
	exit();
};
$idku=$_SESSION['userid'];
$tapel = $_SESSION['tapel'];
$smt = $_SESSION['smt'];
$level = $_SESSION['level'];
//$cfg=$connect->query("select * from konfigurasi")->fetch_assoc();
$bioku = $connect->query("select * from ptk where ptk_id='$idku'")->fetch_assoc();
$filegbr = 'https://sdi-aljannah.web.id/apins/images/ptk/'.$bioku['gambar'];
$file_headerss = @get_headers($filegbr);
if($file_headerss[0] == 'HTTP/1.1 404 Not Found') {
	//$exists = false;
	$avatar="profile-7.jpg";
}else {
	//$exists = true;
	$avatar='https://sdi-aljannah.web.id/apins/images/ptk/'.$bioku['gambar'];
};
$status=$bioku['status_kepegawaian_id'];
$namagr=$bioku['nama'];
$namany=explode(" ",$namagr);
//$level=$bioku['jenis_ptk_id'];
$jns_ptk = $connect->query("select * from jenis_ptk where jenis_ptk_id='$level'")->fetch_assoc();
$status_ptk = $connect->query("select * from status_kepegawaian where status_kepegawaian_id='$status'")->fetch_assoc();
if($level==96){
		//$sql_mk=mysqli_query($koneksi, "select * from rombel where tapel='$tapel' and pai='$idku' order by nama_rombel asc");
	$nk=$connect->query("select * from rombel where tapel='$tapel' and pai='$idku' order by nama_rombel asc")->fetch_assoc();
	$kelas=$nk['nama_rombel'];
}elseif($level==95){
		//$sql_mk=mysqli_query($koneksi, "select * from rombel where tapel='$tapel' and penjas='$idku' order by nama_rombel asc");
	$nk=$connect->query("select * from rombel where tapel='$tapel' and penjas='$idku' order by nama_rombel asc")->fetch_assoc();
	$kelas=$nk['nama_rombel'];
}elseif($level==94){
		//$sql_mk=mysqli_query($koneksi, "select * from rombel where tapel='$tapel' and inggris='$idku' order by nama_rombel asc");
	$nk=$connect->query("select * from rombel where tapel='$tapel' and inggris='$idku' order by nama_rombel asc")->fetch_assoc();
	$kelas=$nk['nama_rombel'];
}elseif($level==97){
		//$sql_mk=mysqli_query($koneksi, "select * from rombel where tapel='$tapel' and pendamping='$idku' order by nama_rombel asc");
	$nk=$connect->query("select * from rombel where tapel='$tapel' and pendamping='$idku' order by nama_rombel asc")->fetch_assoc();
	$kelas=$nk['nama_rombel'];
}elseif($level==98){
		//$sql_mk=mysqli_query($koneksi, "select * from rombel where tapel='$tapel' and wali_kelas='$idku' order by nama_rombel asc");
	$nk=$connect->query("select * from rombel where tapel='$tapel' and wali_kelas='$idku' order by nama_rombel asc")->fetch_assoc();
	$kelas=$nk['nama_rombel'];
}else{
	$kelas="1";
};
if($kelas==''){
	$norombel=true;
}else{
	$norombel=false;
};
$ab=substr($kelas,0,1);
if($level==11){
	$laki = $connect->query("select * from siswa where jk='L' and status=1")->num_rows;
	$wanita=$connect->query("select * from siswa where jk='P' and status=1")->num_rows;
}else{
	$laki = $connect->query("select * from penempatan JOIN siswa USING(peserta_didik_id) where siswa.jk='L' and penempatan.rombel='$kelas' and penempatan.tapel='$tapel' and penempatan.smt='$smt'")->num_rows;
	$wanita=$connect->query("select * from penempatan JOIN siswa USING(peserta_didik_id) where siswa.jk='L' and penempatan.rombel='$kelas' and penempatan.tapel='$tapel' and penempatan.smt='$smt'")->num_rows;
};
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <title><?=$apps['nama'];?> <?=$apps['versi'];?></title>

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
	<!-- Page JS Plugins CSS -->
    <link rel="stylesheet" href="<?=base_url();?>assets/js/plugins/datatables-bs5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="<?=base_url();?>assets/js/plugins/datatables-buttons-bs5/css/buttons.bootstrap5.min.css">
    <link rel="stylesheet" href="<?=base_url();?>assets/js/plugins/datatables-responsive-bs5/css/responsive.bootstrap5.min.css">
	<link rel="stylesheet" href="<?=base_url();?>assets/js/plugins/sweetalert2/sweetalert2.min.css">

    <!-- Fonts and Codebase framework -->
    <link rel="stylesheet" id="css-main" href="<?=base_url();?>assets/css/codebase.min.css">

    <!-- You can include a specific file from css/themes/ folder to alter the default color theme of the template. eg: -->
    <!-- <link rel="stylesheet" id="css-theme" href="assets/css/themes/flat.min.css"> -->
    <!-- END Stylesheets -->
  </head>
  <body>
    <div id="page-loader" class="show"></div>
    <!-- Page Container -->
    <div id="page-container" class="sidebar-o sidebar-dark enable-page-overlay side-scroll page-header-fixed page-header-modern">
      <!-- Side Overlay-->
      <?php include 'inc/side-overlay.php';?>
	  <!-- END Side Overlay -->

      <!-- Sidebar -->
      <!--
        Helper classes

        Adding .smini-hide to an element will make it invisible (opacity: 0) when the sidebar is in mini mode
        Adding .smini-show to an element will make it visible (opacity: 1) when the sidebar is in mini mode
          If you would like to disable the transition, just add the .no-transition along with one of the previous 2 classes

        Adding .smini-hidden to an element will hide it when the sidebar is in mini mode
        Adding .smini-visible to an element will show it only when the sidebar is in mini mode
        Adding 'smini-visible-block' to an element will show it (display: block) only when the sidebar is in mini mode
      -->
      <?php include 'inc/sidebar.php';?>
	  <!-- END Sidebar -->

      <!-- Header -->
      <?php include 'inc/header.php';?>
	  <!-- END Header -->

      <!-- Main Container -->
      <main id="main-container">
        <!-- Page Content -->
        <div class="content">
		  <?php 
		  $halaman = $params[2];
		  if($params[2]==="" or $params[2]==="beranda"){
			  if($maintenis==1 and $level<>11){
				include "pages/perawatan.php";
			  }else{
			    include 'pages/home.php';
			  };
		  }else{
			  if($maintenis==1 and $level<>11){
				include "pages/perawatan.php";
			  }else{
				if($norombel){
					include "pages/norombel.php";
				}else{
					if( file_exists('pages/' . $halaman . '.php') ) {
						include 'pages/' . $halaman . '.php';
					}else{
						include "pages/error.php";
					}
				}
			  }
		  };
		  ?>
		</div>
        <!-- END Page Content -->
      </main>
      <!-- END Main Container -->

      <!-- Footer -->
      <?php include 'inc/footer.php';?>
      <!-- END Footer -->
    </div>
    <!-- END Page Container -->

    <!--
        Codebase JS

        Core libraries and functionality
        webpack is putting everything together at assets/_js/main/app.js
    -->
    <script src="<?=base_url();?>assets/js/codebase.app.min.js"></script>
	
	<!-- jQuery (required for DataTables plugin) -->
    <script src="<?=base_url();?>assets/js/lib/jquery.min.js"></script>

    <!-- Page JS Plugins -->
    <script src="<?=base_url();?>assets/js/plugins/chart.js/chart.min.js"></script>
	<script src="<?=base_url();?>assets/js/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="<?=base_url();?>assets/js/plugins/datatables-bs5/js/dataTables.bootstrap5.min.js"></script>
    <script src="<?=base_url();?>assets/js/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="<?=base_url();?>assets/js/plugins/datatables-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
    <script src="<?=base_url();?>assets/js/plugins/datatables-buttons/dataTables.buttons.min.js"></script>
    <script src="<?=base_url();?>assets/js/plugins/datatables-buttons-bs5/js/buttons.bootstrap5.min.js"></script>
    <script src="<?=base_url();?>assets/js/plugins/datatables-buttons-jszip/jszip.min.js"></script>
    <script src="<?=base_url();?>assets/js/plugins/datatables-buttons-pdfmake/pdfmake.min.js"></script>
    <script src="<?=base_url();?>assets/js/plugins/datatables-buttons-pdfmake/vfs_fonts.js"></script>
    <script src="<?=base_url();?>assets/js/plugins/datatables-buttons/buttons.print.min.js"></script>
    <script src="<?=base_url();?>assets/js/plugins/datatables-buttons/buttons.html5.min.js"></script>
	<script src="<?=base_url();?>assets/js/plugins/sweetalert2/sweetalert2.all.min.js"></script>
	<script src="<?=base_url();?>assets/js/plugins/bootstrap-notify/bootstrap-notify.min.js"></script>
	<script>Codebase.helpersOnLoad(['jq-notify']);</script>

    <!-- Page JS Code -->
	<?php 
	$hal = $params[2];
	if($hal==="" or $hal==="beranda"){
	?>
		<script src="<?= base_url(); ?>assets/js/pages/be_pages_dashboard.min.js"></script>
	<?php 
	}else{
		if( file_exists('assets/js/pages/' . $hal . '.js') ) {
	?>
		<script src="<?= base_url(); ?>assets/js/pages/<?=$hal;?>.js"></script>
	<?php 
		}else{
	?>
		
	<?php 
		}
	}
	?>
  </body>
</html>