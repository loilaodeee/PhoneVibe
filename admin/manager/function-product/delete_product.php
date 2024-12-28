<?php
require_once '../../../config.php';

if (isset($_GET['id'])) {
    $productID = $_GET['id'];

    try {
        $pdo->beginTransaction();

        $stmt = $pdo->prepare("SELECT * FROM products WHERE id = :productID");
        $stmt->execute([":productID" => $productID]);
        $product = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($product) {
            $imageStmt = $pdo->prepare("SELECT Image FROM product_colors WHERE ProductID = :productID");
            $imageStmt->execute([":productID" => $productID]);
            $images = $imageStmt->fetchAll(PDO::FETCH_ASSOC);


            foreach ($images as $image) {

                $imagePath = "../../img/" . $image['Image'];

                if (file_exists($imagePath)) {
                    unlink($imagePath);  
                }
            }

           
            $deleteColorsStmt = $pdo->prepare("DELETE FROM product_colors WHERE ProductID = :productID");
            $deleteColorsStmt->execute([":productID" => $productID]);

            $brandDir = '';
            switch ($product['BrandID']) {
                case 1:
                    $brandDir = 'samsung/';
                    break;
                case 2:
                    $brandDir = 'iphone/';
                    break;
                case 3:
                    $brandDir = 'xiaomi/';
                    break;
                case 4:
                    $brandDir = 'oppo/';
                    break;
                case 5:
                    $brandDir = 'vivo/';
                    break;
                case 6:
                    $brandDir = 'realme/';
                    break;
                default:
                    $brandDir = 'others/';
                    break;
            }
            $productDir = "../../img/" . $brandDir . "product_" . $productID;

            if (is_dir($productDir)) {
                $files = glob($productDir . '/*');
                foreach ($files as $file) {
                    if (is_file($file)) {
                        unlink($file);  
                    }
                }

                rmdir($productDir);
            }

            $deleteProductStmt = $pdo->prepare("DELETE FROM products WHERE id = :productID");
            $deleteProductStmt->execute([":productID" => $productID]);
            $pdo->commit();


            header("Location: ../product.php");
            exit;
        } else {
            echo "Sản phẩm không tồn tại.";
        }
    } catch (Exception $e) {

        $pdo->rollBack();
        echo "Có lỗi xảy ra: " . $e->getMessage();
    }
} else {
    echo "Không có ID sản phẩm.";
}
?>








