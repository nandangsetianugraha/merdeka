<?php require_once '../../inc/db_connect.php';$output = array('success' => false, 'messages' => array());$memberId = $_POST['member_id'];$materi=$connect->query("SELECT * FROM lingkup_materi WHERE id_lm='$memberId'")->fetch_assoc();$kelas=$materi['kelas'];$smt=$materi['smt'];//$tapel=$materi['tapel'];$mapel=$materi['mapel'];$lm=$materi['lm'];$cekrapor=$connect->query("SELECT * FROM tp WHERE kelas='$kelas' AND lm='$lm' AND mapel='$mapel'")->num_rows;if($cekrapor>0){	$output['success'] = false;	$output['messages'] = 'Materi ini masih ada TP terdaftar, silahkan hapus terlebih dahulu TP nya!';}else{	$sql = "DELETE from lingkup_materi where id_lm= {$memberId}";	$query = $connect->query($sql);	if($query === TRUE) {		$output['success'] = true;		$output['messages'] = 'Lingkup Materi Berhasil dihapus';	} else {		$output['success'] = false;		$output['messages'] = 'Error saat mencoba menghapus Lingkup Materi';	}};// close database connection$connect->close();echo json_encode($output);