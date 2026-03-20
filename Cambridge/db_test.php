<?php
$mysqli = new mysqli('localhost', 'root', '', 'cambridge_school');

if ($mysqli->connect_error) {
    die('❌ Connect Error: ' . $mysqli->connect_error);
}
echo '✅ Database connection successful!';
?>
