<?php 

require_once '../../inc/db_connect.php';
$kelas=$_GET['kelas'];
$smt=$_GET['smt'];
$mp=$_GET['mp'];
$lm=$_GET['lm'];
$output = array('data' => array());

$sql = "select * from tp where kelas='$kelas' and lm='$lm' and mapel='$mp' order by tp asc";
$query = $connect->query($sql);
while($s=$query->fetch_assoc()) {
	$ids=$s['id_tp'];
	$actionButton = '
	<a href="#editTema" class="btn btn-effect-ripple btn-xs btn-danger" type="button" id="'.$ids.'" data-toggle="modal" data-id="'.$ids.'"><i class="fa fa-edit"></i> Edit</a>
	<button class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="modal" data-target="#removeMateriModal" onclick="removeTujuan('.$ids.')"> <i class="fa fa-trash"></i> Hapus</button>
	';
	$output['data'][] = array(
		$s['tp'],
		$s['nama_tp'],
		$actionButton
	);
	
};

	

// database connection close
$connect->close();

echo json_encode($output);