<?php
session_start();

require 'koneksi/koneksi.php';
if (isset($_POST['login'])){
    $email =$_POST['email'];
    $password =$_POST['password'];

    $sql = "select * from admin where email ='$email' and password ='$password'";
    $query = mysqli_query($koneksi, $sql);

    if (mysqli_num_rows($query) > 0) {
        $row = mysqli_fetch_assoc($query);
        if ($row['Level'] =='admin'){
            $_SESSION['admin'] = true;
            $_SESSION['email'] = $email;
            echo "<script>
            alert('Berhasil login sebagai Admin');
            document.location.href='admin/index.php';
            </script>";
        } else {
            $error = true;
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Koperasi Simpanan</title>

    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="admin/plugins/fontawesome-free/css/all.min.css">
</head>
<body>
<section class="vh-100" style="background-color: #9A616D;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block centered">
              <img src="pictures/login.jpg"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">                
                <form action="" method="POST">

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <span class="h1 fw-bold mb-0"></span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                  <div class="form-outline mb-4">
                    <input type="email" name="email" class="form-control form-control-lg" autofocus  />
                    <label class="form-label" for="email">Email Address</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" name="password" class="form-control form-control-lg" />
                    <label class="form-label" for="password">Password</label>
                  </div>

                  <div class="pt-1 mb-4">
                    <button class="btn btn-dark btn-lg btn-block" type="submit" name="login" value="Login">Login</button>
                  </div>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>