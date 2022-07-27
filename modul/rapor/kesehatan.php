<?php 
require_once '../../inc/db_connect.php';
function TanggalIndo($tanggal)
{
	$bulan = array ('Januari',
				'Februari',
				'Maret',
				'April',
				'Mei',
				'Juni',
				'Juli',
				'Agustus',
				'September',
				'Oktober',
				'November',
				'Desember'
			);
	$split = explode('-', $tanggal);
	return $split[2] . ' ' . $bulan[ (int)$split[1]-1 ] . ' ' . $split[0];
};
$output = array('data' => array());
$kelas=$_GET['kelas'];
$smt=$_GET['smt'];
$tapel=$_GET['tapel'];
$sql = "select * from penempatan where rombel='$kelas' and tapel='$tapel' and smt='$smt' order by nama asc";
$query = $connect->query($sql);
while ($row = $query->fetch_assoc()) {
	$idp=$row['peserta_didik_id'];
	$sql1 = "select * from siswa where peserta_didik_id='$idp'";
	$query1 = $connect->query($sql1);
	$row1 = $query1->fetch_assoc();
	$filegbr = 'https://sdi-aljannah.web.id/apins/images/siswa/'.$row1['avatar'];
	$file_headerss = @get_headers($filegbr);
	if($file_headerss[0] == 'HTTP/1.1 404 Not Found') {
		//$exists = false;
		$avatarm="https://sdi-aljannah.web.id/apins/images/siswa/user-default.png";
	}else {
		//$exists = true;
		$avatarm='https://sdi-aljannah.web.id/apins/images/siswa/'.$row1['avatar'];
	};
	$sqlp = "SELECT * FROM data_kesehatan WHERE peserta_didik_id='$idp' and smt='$smt' and tapel='$tapel'";
	$tombol = '
		<a class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#modalkesehatan" data-kelas="'.$kelas.'" data-tapel="'.$tapel.'" data-smt="'.$smt.'" data-pdid="'.$idp.'" id="getKes"><i class="fa fa-plus-circle"></i></a>
	';
		$pn = $connect->query($sqlp)->fetch_assoc();
		$tng=$pn['tinggi'];
		$brt=$pn['berat'];
		$telinga=$pn['pendengaran'];
		$mata=$pn['penglihatan'];
		$gg=$pn['gigi'];
		$lain=$pn['lainnya'];
	
	//$namasis=$pn['nama'];
	$output['data'][] = array(
		$row['nama'],
		$tng,
		$brt,
		$telinga,
		$mata,
		$gg,
		$lain,
		$tombol
	);
}

// database connection close
$connect->close();

echo json_encode($output);