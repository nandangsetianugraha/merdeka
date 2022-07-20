<?phpinclude("db_connect.php");
$provinsi_id = $_GET['prov_id'];$sql3 = "select * from kabupaten where id_provinsi='$provinsi_id'";$query3 = $connect->query($sql3);echo "<option value='0'>Pilih Kabupaten</option>";while($nk=$query3->fetch_assoc()){
  echo "<option value='".$nk['id']."'>".$nk['nama']."</option>";}?>