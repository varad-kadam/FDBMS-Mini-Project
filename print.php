<?php
if (!isset($_GET['ticket']))
	die("Error: Invalid Ticket");

require_once 'inc/database.php';
$conn = initDB();
$res = $conn->query("select *,t.id as tid, t.seats as seats, b.id as bid, u.id as uid from tickets t, buses b, users u where t.bus_id = b.id and t.id =" . $_GET['ticket']);
$ticket = $res->fetch_assoc();
echo "Thank You For Travelling With Us!" . "<br>" . "<br>";
echo "Ticket ID: " . $ticket['tid'] . "<br>";
echo "Bus ID: " . $ticket['bid'] . "<br>";
echo "User ID: " . $ticket['uid'] . "<br>";
echo "Seats: " . $ticket['seats'] . "<br>";
$conn->close();
?>