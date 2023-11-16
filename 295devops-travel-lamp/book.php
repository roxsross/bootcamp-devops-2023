 <?php

session_start();

if(!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !==true)
{
    header("location: login.php");
}

?>
<?php 

require_once "config.php";

$user = $_SESSION['username'];
$query = mysqli_query($conn,"select user_id from user where username = '$user'");
$row =mysqli_fetch_array($query);
$uid = $row['user_id'];


if (isset($_POST['send'])){
    //$userid=$_POST['uid'];
    $name=$_POST['name'];
    $email=$_POST['email'];
    $phone=$_POST['phone'];
    $address=$_POST['address'];
    $package=$_POST['package'];
    $adults=$_POST['adults'];
    $children=$_POST['children'];
    $date=$_POST['date'];


$request="insert into booking(user_id,name,email,phone,address,package_id,adults,children,date) values('$uid','$name','$email','$phone','$address','$package','$adults','$children','$date')";
$thik=mysqli_query($conn,$request);
if($thik){
    header("location: confirm.php");
}else{
    echo "Something went wrong... cannot redirect!";
}
}
else{
    // echo 'something went wrong try again';
}

?> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>295devopstravel</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="heading" style="background:url(images/some-bg.jpg) no-repeat">
    
</div>
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
                    <li class = "nav-item">
                        <a href = "logout.php" class = "nav-link">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <header class = "flex header-sm">
            <div class = "container">
                <div class = "header-title">
                    <h1>Booking Form</h1>
                    <p>Secure your dream getaway! Fill out the booking form below to start your adventure. Personalize your trip and make unforgettable memories with us.</p>
                </div>
            </div>
        </header>
   

<section id="book" class="py-4">
    <div class="container mt-4">
    <form action="book.php" method="post" class="book-form" >
            <div class="form row">
                <label>Name</label>
                <input type="text" placeholder="Enter name" name="name" class="form-control" id="name">
            </div>
            <br>
            <div class="form row">
                <label>Email</label>
                <input type="text" placeholder="Enter email" name="email" class="form-control" id="email">
            </div>
            <br>
            <div class="form row">
                <label>Phone</label>
                <input type="text" placeholder="Enter number" name="phone" class="form-control" id="phone">
            </div>
            <br>
            <div class="form row">
                <label>Address</label>
                <input type="text" placeholder="Enter address" name="address" class="form-control" id="address">
            </div>
            <br>
            <div class="form row">
                <label for="package">Package</label>
                <select name="package" id="package" placeholder="Select" autocomplete="off" class="form-control" id="package">
                    <option value="NULL">Select</option>
                    <option value=1>Isla de Margarita</option>
                    <option value=2>Isla de Coche</option>
                    <option value=3>Calafate</option>
                    <option value=4>Cataratas de Iguazu</option>
                    <option value=5>Buenos Aires</option>
                    <option value=6>Buenos Aires at night</option>
                </select>
            </div>
            <br>
            <div class="form row">
                <label>Number of adults</label>
                <input type="number" placeholder="Enter the number of adults" name="adults" class="form-control" id="adults">
            </div>
            <br>
            <div class="form row">
                <label>Number of children</label>
                <input type="number" placeholder="Enter the number of children" name="children" class="form-control" id="children">
            </div>
            <br>
            <div class="form row">
                <label>Date</label>
                <input type="date" name="date" class="form-control" id="date">
            </div>
            <br>
            <div >
                <input name="$uid" type="hidden" >
            </div>
        
        <input type="submit" value="Submit" class= "btn" name="send">
    </form>
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
                    <li><a href="packages.php"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Isla de Margarita</font></font></a></li>
                        <li><a href="packages.php"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buenos Aires</font></font></a></li>
                        <li><a href="packages.php"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Iguazu</font></font></a></li>
                        <li><a href="packages.php"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Calafate</font></font></a></li>
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

</body>
</html>


