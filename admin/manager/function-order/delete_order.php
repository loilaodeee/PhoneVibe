<?php
session_start();


if (!isset($_SESSION['user_email'])) {
    echo "Bạn cần đăng nhập để thực hiện hành động này.";
    exit();
}


$user_email = $_SESSION['user_email'];

include "../../../config.php";

try {
    $sql = "SELECT RoleID FROM users WHERE Email = :email";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':email' => $user_email]);

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && ($user['RoleID'] == 5 || $user['RoleID'] == 6)) {
        if (isset($_GET['OrderID'])) {
            $orderID = $_GET['OrderID'];

            $pdo->beginTransaction();


            $deleteWarrantySql = "DELETE FROM warranty_accepts WHERE BillID IN (SELECT id FROM bills WHERE OrderdetailsID IN (SELECT id FROM orderdetails WHERE OrderID = :orderID))";
            $stmtWarranty = $pdo->prepare($deleteWarrantySql);
            $stmtWarranty->execute([':orderID' => $orderID]);

            $deleteBillsSql = "DELETE FROM bills WHERE OrderdetailsID IN (SELECT id FROM orderdetails WHERE OrderID = :orderID)";
            $stmtBills = $pdo->prepare($deleteBillsSql);
            $stmtBills->execute([':orderID' => $orderID]);

            $deleteDetailsSql = "DELETE FROM orderdetails WHERE OrderID = :orderID";
            $stmtDetails = $pdo->prepare($deleteDetailsSql);
            $stmtDetails->execute([':orderID' => $orderID]);

            $deleteOrderSql = "DELETE FROM orders WHERE id = :orderID";
            $stmtOrder = $pdo->prepare($deleteOrderSql);
            $stmtOrder->execute([':orderID' => $orderID]);

            $pdo->commit();

            header("Location: ../order.php");
            exit();
        } else {
            echo "Không có đơn hàng để xóa.";
            exit();
        }
    } else {

        $_SESSION['message'] = "Bạn không có quyền xóa đơn hàng.";
        header("Location: ../order.php");
        exit();
    }
} catch (PDOException $e) {

    $pdo->rollBack();
    echo "Lỗi khi xóa đơn hàng: " . $e->getMessage();
}
?>
