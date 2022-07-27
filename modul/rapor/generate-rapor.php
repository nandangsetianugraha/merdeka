<?php 
require_once '../../inc/db_connect.php';
$kelas=$_GET['kelas'];
$mp=$_GET['mp'];
$tapel=$_GET['tapel'];
$smt=$_GET['smt'];
$pdid=$_GET['pdid'];
$ab=substr($kelas,0,1);
$validator = array('success' => false, 'messages' => array());
$ceksts=$connect->query("SELECT * FROM sts WHERE id_pd='$pdid' AND kelas='$kelas' AND smt='$smt' AND tapel='$tapel' AND mapel='$mp'")->num_rows;
$ceksas=$connect->query("SELECT * FROM sas WHERE id_pd='$pdid' AND kelas='$kelas' AND smt='$smt' AND tapel='$tapel' AND mapel='$mp'")->num_rows;
if($ceksts>0 or $ceksas>0){
	$kelebihan=$connect->query("SELECT MIN(nilai) as minimal, lm, tp FROM formatif WHERE id_pd='$pdid' AND kelas='$kelas' AND smt='$smt' AND tapel='$tapel' AND mapel='$mp'")->fetch_assoc();
	$kelemahan=$connect->query("SELECT MAX(nilai) as minimal, lm, tp FROM formatif WHERE id_pd='$pdid' AND kelas='$kelas' AND smt='$smt' AND tapel='$tapel' AND mapel='$mp'")->fetch_assoc();
	$lm1=$kelebihan['lm'];
	$tp1=$kelebihan['tp'];
	$lm2=$kelemahan['lm'];
	$tp2=$kelemahan['tp'];
	$tujuan1=$connect->query("SELECT * FROM tp WHERE kelas='$kelas' AND lm='$lm1' AND tp='$tp1' AND mapel='$mp'")->fetch_assoc();
	$tujuan2=$connect->query("SELECT * FROM tp WHERE kelas='$kelas' AND lm='$lm2' AND tp='$tp2' AND mapel='$mp'")->fetch_assoc();
	$deskripsi1="Menunjukkan pemahaman sangat baik dalam ".$tujuan1['nama_tp'];
	$deskripsi2="Perlu bantuan dalam ".$tujuan2['nama_tp'];
	$nDes=$deskripsi1."|".$deskripsi2;
	$rataFor=$connect->query("SELECT AVG(nilai) as rataformatif FROM formatif WHERE id_pd='ukz4lqlp-1ae3-j1al-6wsa-1mk66n7nhlni' AND kelas='$kelas' AND smt='$smt' AND tapel='$tapel' AND mapel='$mp'")->fetch_assoc();
	$rataSum=$connect->query("SELECT AVG(nilai) as ratasumatif FROM sumatif WHERE id_pd='$pdid' AND kelas='$kelas' AND smt='$smt' AND tapel='$tapel' AND mapel='$mp'")->fetch_assoc();
	$nilaiSTS=$connect->query("SELECT * FROM sts WHERE id_pd='$pdid' AND kelas='$kelas' AND smt='$smt' AND tapel='$tapel' AND mapel='$mp'")->fetch_assoc();
	$nilaiSAS=$connect->query("SELECT * FROM sas WHERE id_pd='$pdid' AND kelas='$kelas' AND smt='$smt' AND tapel='$tapel' AND mapel='$mp'")->fetch_assoc();
	$nilaiRapor=round(($rataFor['rataformatif']+$rataSum['ratasumatif']+$nilaiSTS['nilai']+$nilaiSAS['nilai'])/4,0);
	$cekrapor=$connect->query("SELECT * FROM raport_ikm WHERE id_pd='$pdid' AND kelas='$kelas' AND smt='$smt' AND tapel='$tapel' AND mapel='$mp'")->num_rows;
	if($cekrapor>0){
		$idr=$connect->query("SELECT * FROM raport_ikm WHERE id_pd='$pdid' AND kelas='$kelas' AND smt='$smt' AND tapel='$tapel' AND mapel='$mp'")->fetch_assoc();
		$idrp=$idr['id_raport'];
		$sql1 = "UPDATE raport_ikm set nilai='$nilaiRapor', deskripsi='$nDes' WHERE id_raport='$idrp'";
		$query1 = $connect->query($sql1);
		if($query1 === TRUE) {			
			$validator['success'] = true;
			$validator['messages'] = "Rapor berhasil diupdate!";		
		} else {		
			$validator['success'] = false;
			$validator['messages'] = "Error update raport???";
		};
	}else{
		$sql1 = "INSERT INTO raport_ikm(id_pd,kelas,smt,tapel,mapel,nilai,deskripsi) VALUES('$pdid','$kelas','$smt','$tapel','$nilaiRapor','$nDes')";
		$query1 = $connect->query($sql1);
		if($query1 === TRUE) {			
			$validator['success'] = true;
			$validator['messages'] = "Rapor berhasil digenerate!";		
		} else {		
			$validator['success'] = false;
			$validator['messages'] = "Error Generate Raport???";
		};
	};
}else{
	$validator['success'] = false;
	$validator['messages'] = "Tidak dapat generate rapor karena nilai STS atau SAS masih belum diisi";
}
$connect->close();

echo json_encode($validator);