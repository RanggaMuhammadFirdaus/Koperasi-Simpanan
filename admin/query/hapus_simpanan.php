<?php
session_start();
require '../../koneksi/koneksi.php';
if(!$_SESSION['admin']){
    echo "<script>
    alert('Anda Belum Login');
    document.location.href='../index.php'
    </script>";
}

$id = $_GET['id_simpanan'];

$sql = "DELETE from simpanan where id_simpanan = '$id'";

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