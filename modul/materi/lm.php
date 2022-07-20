<?php 

require_once '../../inc/db_connect.php';
$kelas=$_GET['kelas'];
$smt=$_GET['smt'];
$mp=$_GET['mp'];
$output = array('data' => array());

$sql = "select * from lingkup_materi where kelas='$kelas' and smt='$smt' and mapel='$mp' order by lm asc";
$query = $connect->query($sql);
while($s=$query->fetch_assoc()) {
	$ids=$s['id_lm'];
	$actionButton = '
	<a href="#editTema" class="btn btn-effect-ripple btn-xs btn-danger" type="button" id="'.$ids.'" data-toggle="modal" data-id="'.$ids.'"><i class="fa fa-edit"></i> Edit</a>
	<button class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="modal" data-target="#removeMateriModal" onclick="removeMateri('.$ids.')"> <i class="fa fa-trash"></i> Hapus</button>
	';
	$output['data'][] = array(
		$s['lm'],
		$s['nama_lm'],
		$actionButton
	);
	
};

	

// database connection close
$connect->close();

echo json_encode($output);