<?php
session_start();

if (!isset($_SESSION['user_email']) || !in_array($_SESSION['RoleID'], [5, 6])) {
    die("Bạn không có quyền truy cập trang này.");
}

include "../../../config.php";

if (isset($_POST['warrantyID']) && isset($_POST['status'])) {
    $warrantyID = $_POST['warrantyID'];
    $status = $_POST['status'];

    try {
        $sql = "UPDATE warranty_accepts SET Status = :status WHERE id = :warrantyID";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':status' => $status, ':warrantyID' => $warrantyID]);

        header("Location: ../warranty.php");
        exit();
    } catch (PDOException $e) {
        die("Lỗi khi cập nhật trạng thái: " . $e->getMessage());
    }
} else {
    die("Dữ liệu không hợp lệ.");
}
