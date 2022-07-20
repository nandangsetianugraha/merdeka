<?php
function base_url($param = []) {

  $base_url = 'http://localhost:8080/merdeka/';
  $result = (!$param) ? $base_url : $base_url . $param;

  return $result;
};


function KonDecRomawi($angka){
    $hsl = "";
    if($angka<1||$angka>3999){
        $hsl = "Batas Angka 1 s/d 3999";
    }else{
         while($angka>=1000){
             $hsl .= "M";
             $angka -= 1000;
         }
         if($angka>=500){
             if($angka>500){
                 if($angka>=900){
                     $hsl .= "M";
                     $angka-=900;
                 }else{
                     $hsl .= "D";
                     $angka-=500;
                 }
             }
         }
         while($angka>=100){
             if($angka>=400){
                 $hsl .= "CD";
                 $angka-=400;
             }else{
                 $angka-=100;
             }
         }
         if($angka>=50){
             if($angka>=90){
                 $hsl .= "XC";
                  $angka-=90;
             }else{
                $hsl .= "L";
                $angka-=50;
             }
         }
         while($angka>=10){
             if($angka>=40){
                $hsl .= "XL";
                $angka-=40;
             }else{
                $hsl .= "X";
                $angka-=10;
             }
         }
         if($angka>=5){
             if($angka==9){
                 $hsl .= "IX";
                 $angka-=9;
             }else{
                $hsl .= "V";
                $angka-=5;
             }
         }
         while($angka>=1){
             if($angka==4){
                $hsl .= "IV";
                $angka-=4;
             }else{
                $hsl .= "I";
                $angka-=1;
             }
         }
    }
    return ($hsl);
}

function strip_only_tags($str, $stripped_tags = null) {
  // Tidak ada tag yang dihapus
  if ($stripped_tags == null) {
    return $str;
  }
  // Dapatkan daftar tag
  // Misal: <b><i><u> menjadi array('b','i','u')
  $tags = explode('>', str_replace('<', '', $stripped_tags));
  $result = preg_replace('#</?(' . implode('|', $tags) . ').*?>#is', '', $str);
  return $result;
};

function TanggalIndo($tanggal){
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
	$pisah = explode('-', $tanggal);
	return (int)$pisah[2] . ' ' . $bulan[ (int)$pisah[1]-1 ] . ' ' . $pisah[0];
};

function limit_words($string, $word_limit){
    $words = explode(" ",$string);
    return implode(" ",array_splice($words,0,$word_limit));
};
