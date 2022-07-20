<?php 
require_once '../../inc/db_connect.php';

function TanggalIndo($tanggal){

    if(!empty($tanggal)){

		$bulan = array (1 =>   'Januari',

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

		return $split[2] . ' ' . $bulan[ (int)$split[1] ] . ' ' . $split[0];

	};

};
$smt=$_GET['smt'];
$tapel=$_GET['tapel'];
$tpl1=substr($tapel,0,4);
$ntpl1=$tpl1-1;
$tpl2=substr($tapel,5,4);
$ntpl2=$tpl2-1;
$ntapel=$ntpl1."/".$ntpl2;
$output = array('data' => array());
if($smt==1){$smts=2;}else{$smts=1;};


$sql = "SELECT * FROM siswa WHERE status=1 order by nama asc";

$query = $connect->query($sql);

while ($row = $query->fetch_assoc()) {

	$idp=$row['peserta_didik_id'];

	$sqlp = "SELECT * FROM penempatan WHERE peserta_didik_id='$idp' and tapel='$tapel' and smt='$smt'";

	$queryp = $connect->query($sqlp);

	$pn = $queryp->num_rows;

	$nisn=$row['nisn'];

	$jk=$row['jk'];
  	if($smt==='1'){
		$adakelas = $connect->query("SELECT * FROM penempatan WHERE peserta_didik_id='$idp' and tapel='$ntapel' and smt='2'")->num_rows;
    }else{
    	$adakelas = $connect->query("SELECT * FROM penempatan WHERE peserta_didik_id='$idp' and tapel='$tapel' and smt='1'")->num_rows;
    };
	if($adakelas>0){
        if($smt==='1'){
            $nkelas = $connect->query("SELECT * FROM penempatan WHERE peserta_didik_id='$idp' and tapel='$ntapel' and smt='2'")->fetch_assoc();
        }else{
            $nkelas = $connect->query("SELECT * FROM penempatan WHERE peserta_didik_id='$idp' and tapel='$ntapel' and smt='1'")->fetch_assoc();
        };
        $kelasnya=$nkelas['rombel'];
	}else{
		$kelasnya="";
	};

	if(file_exists( $_SERVER{'DOCUMENT_ROOT'} . "/cp/siswa/".$nisn.".jpg")){

		$gbr="../siswa/$nisn.jpg";

	}else{

		if($jk=="P"){

			$gbr="../siswa/p.png";

		}else{

			$gbr="../siswa/l.png";

		};

	};

	if($pn>0){

	}else{

			$actionButton = '

		  <button class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="modal" data-target="#penempatanMemberModal" onclick="penempatanMember('.$row['id'].')"> Ambil</button>

		';

		$tgl=$row['tempat'].", ".TanggalIndo($row['tanggal']);

		$output['data'][] = array(

			$row['nama'],
			$kelasnya,
			$actionButton

		);

	}

}


$connect->close();



echo json_encode($output);