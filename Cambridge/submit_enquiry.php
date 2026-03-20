<?php
// Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Database configuration
$host = 'localhost';
$dbname = 'cambridge_school';
$username = 'root';
$password = '';

// Create database connection
$conn = new mysqli($host, $username, $password, $dbname);
// $mysqli = new mysqli('localhost:3307', 'root', '', 'cambridge_school');

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Get and sanitize form input
    $parent_name = trim($_POST['parent_name'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $phone = trim($_POST['phone'] ?? '');
    $child_name = trim($_POST['child_name'] ?? '');
    $grade = trim($_POST['grade'] ?? '');
    $message = trim($_POST['message'] ?? '');

    // Prepare SQL statement
    $stmt = $conn->prepare("INSERT INTO enquiries (parent_name, email, phone, child_name, grade, message) VALUES (?, ?, ?, ?, ?, ?)");

    if ($stmt) {
        // Bind parameters
        $stmt->bind_param("ssssss", $parent_name, $email, $phone, $child_name, $grade, $message);

        // Execute and check
        if ($stmt->execute()) {
            echo "<h2>✅ Enquiry submitted successfully!</h2>";
        } else {
            echo "<h2>❌ Failed to submit enquiry: " . htmlspecialchars($stmt->error) . "</h2>";
        }

        $stmt->close();
    } else {
        echo "<h2>❌ SQL Error: " . htmlspecialchars($conn->error) . "</h2>";
    }
} else {
    echo "<h2>⚠️ Invalid request method. Please submit the form.</h2>";
}

// Close connection
$conn->close();
?>
