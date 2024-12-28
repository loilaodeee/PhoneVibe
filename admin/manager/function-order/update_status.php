<?php

include '../../../config.php';

if (isset($_POST['orderID']) && isset($_POST['status'])) {
    $orderID = $_POST['orderID'];
    $status = $_POST['status'];

    try {

        $sql = "UPDATE orders SET Status = :status WHERE id = :orderID";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':status'=>$status, ':orderID'=>$orderID]);

        header("Location: ../order.php");
        exit;
    } catch (PDOException $e) {
        echo "Lỗi khi cập nhật trạng thái đơn hàng: " . $e->getMessage();
    }
}
?>
