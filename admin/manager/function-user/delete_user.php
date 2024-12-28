<?php
session_start();
require "../../../config.php";
$email = $_SESSION['user_email'];  // Lấy email của người dùng đang đăng nhập

// Truy vấn lấy thông tin người dùng dựa trên email
$sql = "SELECT Username FROM users WHERE Email=:Email";
$stmt = $pdo->prepare($sql);
$stmt->execute([':Email' => $email]);
$data = $stmt->fetch(PDO::FETCH_ASSOC);

// Kiểm tra nếu người dùng đã đăng nhập có tồn tại
if (!$data) {
    echo "Người dùng không tồn tại.";
    exit();
}

$username_logged_in = $data['Username']; 


if (isset($_GET['id'])) {
    $username_to_delete = $_GET['id']; 

    if ($username_logged_in == $username_to_delete) {
        $_SESSION['warn_delete_user']="Không thể xóa tài khoản đang đăng nhập!";
        header("Location: ../user.php");
        exit();
    }

    try {

        $pdo->beginTransaction();
    
        $sql = "DELETE FROM warranty_accepts WHERE CustomerID = (SELECT id FROM users WHERE username = :username)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':username' => $username_to_delete]);

        $sql = "DELETE FROM bills WHERE OrderdetailsID IN (SELECT id FROM orderdetails WHERE OrderID IN (SELECT id FROM orders WHERE CustomerID = (SELECT id FROM users WHERE username = :username)))";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':username' => $username_to_delete]);

        $sql = "DELETE FROM orderdetails WHERE OrderID IN (SELECT id FROM orders WHERE CustomerID = (SELECT id FROM users WHERE username = :username))";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':username' => $username_to_delete]);

        $sql = "DELETE FROM orders WHERE CustomerID = (SELECT id FROM users WHERE username = :username)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':username' => $username_to_delete]);

        $sql = "DELETE FROM carts WHERE CustomerID = (SELECT id FROM users WHERE username = :username)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':username' => $username_to_delete]);

        $sql = "DELETE FROM users WHERE username = :username";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':username' => $username_to_delete]);

        $pdo->commit();

        header("Location: ../user.php");
    } catch (PDOException $e) {
        $pdo->rollBack();
        echo "Lỗi khi xóa: " . $e->getMessage();
    }
} else {
    echo "Không có người dùng để xóa.";
}
?>
