<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hospital_db"; // Update with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Validate user login
    $sql = "SELECT * FROM Users WHERE User_email = ? AND Password = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        // Valid login
        $user = $result->fetch_assoc();
        $_SESSION['user_id'] = $user['User_id'];
        $_SESSION['user_name'] = $user['Name'];

        // Redirect based on user type
        header("Location: dashboard.php");
        exit();
    } else {
        // Invalid login
        echo "<div class='error'>Invalid email or password</div>";
    }
}
$conn->close();
?>