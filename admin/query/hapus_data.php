<?php
session_start();
require '../../koneksi/koneksi.php';
if(!$_SESSION['admin']){
    echo "<script>
    alert('Anda Belum Login');
    document.location.href='../index.php'
    </script>";
}

$NIK = $_GET['NIK'];

$sql = "DELETE from anggota where NIK = '$NIK'";

$query = mysqli_query($koneksi,$sql);

if($query){
    echo "<script>
    alert('Data Berhasil Dihapus');
    document.location.href='../index.php'
    </script>";
}else{
    echo "<script>
    alert('Data Gagal Dihapus');
    </script>";
}
?>