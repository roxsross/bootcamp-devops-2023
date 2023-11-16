<?php
session_start();
if(isset($_SESSION['username']))
{
    header("location: book.php");
    exit;
}
require_once "config.php";

$username = $password = "";
$err = "";

if ($_SERVER['REQUEST_METHOD'] == "POST"){
    if(empty(trim($_POST['username'])) || empty(trim($_POST['password'])))
    {
        $err = "Please enter username + password";
    }
    else{
        $username = trim($_POST['username']);
        $password = trim($_POST['password']);
    }


if(empty($err))
{
    $sql = "SELECT user_id, username, password FROM user WHERE username = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "s", $param_username);
    $param_username = $username;
    
    if(mysqli_stmt_execute($stmt)){
        mysqli_stmt_store_result($stmt);
        if(mysqli_stmt_num_rows($stmt) == 1)
                {
                    mysqli_stmt_bind_result($stmt, $id, $username, $hashed_password);
                    if(mysqli_stmt_fetch($stmt))
                    {
                        if(password_verify($password, $hashed_password))
                        {
                            session_start();
                            $_SESSION["username"] = $username;
                            $_SESSION["id"] = $id;
                            $_SESSION["loggedin"] = true;
                            header("location:book.php");
                            
                        }
                    }

                }

    }
}    


}


?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="style.css">
    <title>295devopstravel</title>
    
  </head>
  <body>
    <nav class = "navbar">
        <div class = "container flex">
            <a href = "index.php" class = "site-brand">
                295DevOps<span>Travel</span>
            </a>

                <ul class = "navbar-nav">
                    <li class = "nav-item">
                        <a href = "index.php" class = "nav-link">Home</a>
                    </li>
                    <li class = "nav-item">
                        <a href = "gallery.php" class = "nav-link">Gallery</a>
                    </li>
                    <li class = "nav-item">
                        <a href = "packages.php" class = "nav-link">Packages</a>
                    </li>
                    <li class = "nav-item">
                        <a href = "login.php" class = "nav-link">BookNow</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    

    <header class = "flex header-sm">
            <div class = "container">
                <div class = "header-title">
                    <h1>Login Here!</h1>
                    <p>Welcome back! Sign in to your account and embark on your next exciting adventure with us.</p>
                </div>
            </div>
        </header>
<section id="login" class="py-4">
    <div class="container mt-4">

<form action="" method="post" class="login-form" >
  <div class="form-row">
    <label for="username">Username</label>
    <input type="text" name="username" class="form-control" id="username" placeholder="Enter Username">
  </div>
  <br>
  <div class="form-row">
    <label for="password">Password</label>
    <input type="password" name="password" class="form-control" id="password" placeholder="Enter Password">
  </div> 
  <br>
  <button type="submit" class="btn btn-primary">Log in</button>
</form> 
<br>
<a href="registration.php">Not a user? Register here!</a>
</div>
</section>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<footer class="py-4">
            <div class="container footer-row">
                <div class="footer-item">
                    <a href="index.php" class="site-brand"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        About </font></font><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Us</font></font></span>
                    </a>
                    <p class="text"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Welcome to our travel! Created by RoxsRoss, our site is your devops gateway to inspiring adventures.  </font><font style="vertical-align: inherit;">We share travel tips, captivating stories, and stunning photos to fuel your wanderlust. </font><font style="vertical-align: inherit;">Join us in exploring the world's wonders. Happy travels!</font></font></p>
                </div>

                <div class="footer-item">
                    <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Follow us on:</font></font></h2>
                    <ul class="social-links">
                        <li>
                            <a href="#">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fab fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fab fa-pinterest"></i>
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="footer-item">
                    <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Popular Places:</font></font></h2>
                    <ul>
                    <li><a href="packages.php"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Isla de Margarita</font></font></a></li>
                        <li><a href="packages.php"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buenos Aires</font></font></a></li>
                        <li><a href="packages.php"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Iguazu</font></font></a></li>
                        <li><a href="packages.php"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Calafate</font></font></a></li>
                    </ul>
                </div>

                <div class="footer-item">
                    <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Contact Us!</font></font></h2>
                    <p class="text"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        295devops@gmail.com
                        </font></font>
                    </p>
                </div>
            </div>
        </footer>
        <script src="script.js"></script>

</body></html>



