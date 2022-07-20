<?php 
require_once '../../function/db_connect.php';
//if form is submitted
if($_POST) {	
	$validator = array('success' => false, 'messages' => array());
	$memberid=$_POST['member_id'];
	$kelas=$_POST['kelas'];
	$tapel=$_POST['tapel'];
	$smt=$_POST['smt'];
	$sqlp = "SELECT * FROM siswa WHERE id = '$memberid'";
	$queryp = $connect->query($sqlp);
	$rs = $queryp->fetch_assoc();
	$ck=$rs['peserta_didik_id'];
	$nama=$connect->real_escape_string($rs['nama']);
	$ada=$connect->query("select * from penempatan where peserta_didik_id='$ck' and tapel='$tapel' and smt='$smt'")->num_rows;
	if($ada>0){
		$validator['success'] = false;
		$validator['messages'] = $nama." Sudah ditempatkan di kelas ".$kelas;
	}else{
		$sql = "insert into penempatan(peserta_didik_id,nama,rombel,tapel,smt) values('$ck','$nama','$kelas','$tapel','$smt')";
		$query = $connect->query($sql);
		if($query === TRUE) {			
			$validator['success'] = true;
			$validator['messages'] = $nama." berhasil ditempatkan di Kelas ".$kelas;		
		} else {		
			$validator['success'] = false;
			$validator['messages'] = "Error while adding the member information";
		};
	};
	// close the database connection
	$connect->close();
	echo json_encode($validator);
}