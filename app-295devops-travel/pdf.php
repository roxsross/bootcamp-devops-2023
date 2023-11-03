<?php
session_start();
require('vendor/autoload.php');
require_once "config.php";

$user = $_SESSION['username'];
$query = mysqli_query($conn, "SELECT user_id FROM user WHERE username = '$user'");
$row = mysqli_fetch_array($query);
$uid = $row['user_id'];

$res = mysqli_query($conn, "SELECT * FROM booking WHERE user_id='$uid' ORDER BY booking_id DESC LIMIT 1");

if(mysqli_num_rows($res) > 0){
    $row = mysqli_fetch_assoc($res);
    $packageId = $row['package_id'];
    $adults = $row['adults'];
    $children = $row['children'];

    // Fetch package details (package price) from the package table
    $packageQuery = mysqli_query($conn, "SELECT * FROM package WHERE package_id='$packageId'");
    $packageRow = mysqli_fetch_assoc($packageQuery);
    $packagePrice = $packageRow['price'];

    // Calculate total price based on the number of adults and children
    $totalPrice = ($adults * $packagePrice) + ($children * $packagePrice);

    // Generate PDF
	$html = "<h1>295devopstravel</h1><br><hr>";
    $html .= "<b>Booking ID:</b> " . $row['booking_id'] . "<br>";
    $html .= "<b>Name:</b> " . $row['name'] . "<br>";
    $html .= "<b>Email:</b> " . $row['email'] . "<br>";
    $html .= "<b>Phone:</b> " . $row['phone'] . "<br>";
    $html .= "<b>Address:</b> " . $row['address'] . "<br>";
    $html .= "<b>Package ID:</b> " . $packageId . "<br>";
    $html .= "<b>Adults:</b> " . $adults . "<br>";
    $html .= "<b>Children:</b> " . $children . "<br>";
    $html .= "<b>Total Price:</b> Rs." . number_format($totalPrice, 2) . "<br><hr></h4>";
	$html .= "<h3>Note:</h3>Payment shall be made after the trip is completed.<br>Rest of the trip details will be mailed to you on your registerd mail id.<br>For more information contact us on: anywherewindow@gmail.com.";

} else {
    echo "No booking found for the user.";
}
$mpdf=new \Mpdf\Mpdf();
$mpdf->WriteHTML($html);
$file='media/'.time().'.pdf';
$mpdf->output($file,'I');
?>
