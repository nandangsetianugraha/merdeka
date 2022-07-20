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
if($kelas==0){
	$sql = "select * from siswa where status='1' order by nama asc";
	$query = $connect->query($sql);
	while ($row = $query->fetch_assoc()) {
		$idp=$row['peserta_didik_id'];
		$filegbr = 'https://sdi-aljannah.web.id/apins/images/siswa/'.$row['avatar'];
		$file_headerss = @get_headers($filegbr);
		if($file_headerss[0] == 'HTTP/1.1 404 Not Found') {
			//$exists = false;
			$avatarm="https://sdi-aljannah.web.id/apins/images/siswa/user-default.png";
		}else {
			//$exists = true;
			$avatarm='https://sdi-aljannah.web.id/apins/images/siswa/'.$row['avatar'];
		};
		$actionButton = '
			<button class="btn btn-icon btn-active-light-primary w-30px h-30px me-3" data-smt="'.$smt.'" data-tapel="'.$tapel.'" data-siswa="'.$idp.'" data-bs-toggle="modal" data-bs-target="#modalsiswa">
					<i class="far fa-address-card fs-4 me-2"></i>
				</button>
			';
		$tgl=ucfirst(strtolower($row['tempat'])).", ".TanggalIndo($row['tanggal']);
		$namasis=$row['nama'];
		$output['data'][] = array(
			"<img alt='image' src='".$avatarm."' class='rounded-circle' width='35' data-toggle='tooltip' title='".$row['nama']."'> ".$row['nama'],
			$row['nis'],
			$row['nisn'],
			$tgl,
			$row['jk'],
			$actionButton
		);
	}
}else{
	$sql = "select * from penempatan where rombel='$kelas' and tapel='$tapel' and smt='$smt' order by nama asc";
	$query = $connect->query($sql);
	while ($row = $query->fetch_assoc()) {
		$idp=$row['peserta_didik_id'];
		$sqlp = "SELECT * FROM siswa WHERE peserta_didik_id='$idp'";
		$pn = $connect->query($sqlp)->fetch_assoc();
		$nisn=$pn['nisn'];
		$jk=$pn['jk'];
		$ids=$pn['id'];
		$rmb=$row['rombel'];
		$filegbr = 'https://sdi-aljannah.web.id/apins/images/siswa/'.$pn['avatar'];
		$file_headerss = @get_headers($filegbr);
		if($file_headerss[0] == 'HTTP/1.1 404 Not Found') {
			//$exists = false;
			$avatarm="user-default.png";
		}else {
			//$exists = true;
			$avatarm='https://sdi-aljannah.web.id/apins/images/siswa/'.$pn['avatar'];
		};
		$actionButton = '
			<button class="btn btn-icon btn-active-light-primary w-30px h-30px me-3" data-smt="'.$smt.'" data-tapel="'.$tapel.'" data-siswa="'.$idp.'" data-bs-toggle="modal" data-bs-target="#modalsiswa">
					<i class="far fa-address-card fs-4 me-2"></i>
				</button>
			';
		$tgl=ucfirst(strtolower($pn['tempat'])).", ".TanggalIndo($pn['tanggal']);
		$namasis=$pn['nama'];
		$output['data'][] = array(
			"<img alt='image' src='".$avatarm."' class='rounded-circle' width='35' data-toggle='tooltip' title='".$pn['nama']."'> ".$pn['nama'],
			$pn['nis'],
			$pn['nisn'],
			$tgl,
			$pn['jk'],
			$actionButton
		);
	}
}
// database connection close
$connect->close();

echo json_encode($output);