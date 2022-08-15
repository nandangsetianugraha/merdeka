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
$lvl=$bioku['jenis_ptk_id'];
$jns_ptk = $connect->query("select * from jenis_ptk where jenis_ptk_id='$lvl'")->fetch_assoc();
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
?>
<?php include "inc/head.php"; ?>
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
	<?php include "inc/script.php"; ?>
    <!-- Page JS Code -->
	<?php 
	$hal = $params[2];
	if($hal==="" or $hal==="beranda"){
	?>
		<script src="<?= base_url(); ?>assets/js/pages/home.js"></script>
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