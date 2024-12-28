<?php
session_start();

if (!isset($_SESSION['user_email']) || !in_array($_SESSION['RoleID'], [5, 6])) {
    die("Bạn không có quyền truy cập trang này.");
}

include "../../../config.php";

if (isset($_GET['warrantyID'])) {
    $warrantyID = $_GET['warrantyID'];

    try {
  
        $sql = "DELETE FROM warranty_accepts WHERE id = :warrantyID";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':warrantyID' => $warrantyID]);

        header("Location: ../warranty.php");
        exit();
    } catch (PDOException $e) {
        die("Lỗi khi xóa bảo hành: " . $e->getMessage());
    }
} else {
    die("Không có ID bảo hành để xóa.");
}
?>
