<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

require_once '../../../config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $productName = $_POST['product_name'];
    $productDescription = $_POST['product_description'];
    $productPrice = $_POST['product_price'];
    $categoryID = $_POST['category'];
    $brandID = $_POST['brand'];
    $colors = isset($_POST['colors']) ? $_POST['colors'] : [];
    $stock = $_POST['stock'];

    if ($categoryID == 1 && count($colors) != 4) {  
        echo "Vui lòng chọn 4 màu sắc cho sản phẩm Điện thoại.";
        exit;
    }

    $colorImages = [];

    try {
        $pdo->beginTransaction();

        $stmt = $pdo->prepare("SELECT id FROM products WHERE ProductName = :productName AND BrandID = :brandID AND CategoryID = :categoryID");
        $stmt->execute([":productName" => $productName, ":brandID" => $brandID, ":categoryID" => $categoryID]);
        $existingProduct = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($existingProduct) {
            $productID = $existingProduct['id'];
        } else {
            $stmt = $pdo->prepare("INSERT INTO products (ProductName, Description, Price, BrandID, CategoryID) 
                                   VALUES (:productName, :productDescription, :productPrice, :brandID, :categoryID)");
            $stmt->execute([":productName" => $productName, ":productDescription" => $productDescription, ":productPrice" => $productPrice, ":brandID" => $brandID, ":categoryID" => $categoryID]);
            $productID = $pdo->lastInsertId();
        }

        if ($categoryID == 1) { 
            $colorKeys = ['main', 'second', 'third', 'fourth'];
            foreach ($colors as $index => $colorName) {
                $colorStmt = $pdo->prepare("SELECT id FROM colors WHERE ColorName = :colorName");
                $colorStmt->execute([":colorName" => $colorName]);
                $colorRow = $colorStmt->fetch(PDO::FETCH_ASSOC);

                if ($colorRow) {
                    $colorID = $colorRow['id'];
                } else {
                    $insertColorStmt = $pdo->prepare("INSERT INTO colors (ColorName) VALUES (:colorName)");
                    $insertColorStmt->execute([":colorName" => $colorName]);
                    $colorID = $pdo->lastInsertId();
                }

                $checkColorStmt = $pdo->prepare("SELECT * FROM product_colors WHERE ProductID = :productID AND ColorID = :colorID");
                $checkColorStmt->execute([":productID" => $productID, ":colorID" => $colorID]);

                if ($checkColorStmt->rowCount() == 0) {
                    $stmt = $pdo->prepare("INSERT INTO product_colors (ProductID, ColorID) 
                                           VALUES (:productID, :colorID)");
                    $stmt->execute([":productID" => $productID, ":colorID" => $colorID]);
                }
                if (!empty($_FILES['images']['name'][$colorKeys[$index]])) {
                    $imageFile = $_FILES['images']['name'][$colorKeys[$index]];
                    if ($_FILES['images']['error'][$colorKeys[$index]] == 0) {

                        $imageTmpName = $_FILES['images']['tmp_name'][$colorKeys[$index]];

                        $uploadDir = "../../../img/";
                        $productDir = $uploadDir . 'product_' . $productID . '/';

                        if (!is_dir($productDir)) {
                            if (!mkdir($productDir, 0777, true)) {
                                echo "Không thể tạo thư mục: " . $productDir . "<br>";
                            }
                        }

                        $imagePath = $productDir . uniqid() . '-' . basename($imageFile);

                        if (move_uploaded_file($imageTmpName, $imagePath)) {
                            $stmt = $pdo->prepare("UPDATE product_colors SET Image = :image WHERE ProductID = :productID AND ColorID = :colorID");
                            $stmt->execute([":image" => $imagePath, ":productID" => $productID, ":colorID" => $colorID]);

                            $colorImages[] = $imagePath; 
                        } else {
                            echo "Lỗi khi tải ảnh lên cho màu " . htmlspecialchars($colorName) . "<br>";
                        }
                    }
                }
            }

            if (count($colorImages) > 0) {
                $randomImage = $colorImages[array_rand($colorImages)]; 
                $stmt = $pdo->prepare("UPDATE products SET Image = :image WHERE id = :productID");
                $stmt->execute([":image" => $randomImage, ":productID" => $productID]);
            }
        } else {  
            if (!empty($_FILES['images']['name']['main'])) {
                $imageFile = $_FILES['images']['name']['main'];
                $imageTmpName = $_FILES['images']['tmp_name']['main'];

                $uploadDir = "../../../img/";
                $productDir = $uploadDir . 'product_' . $productID . '/';

                if (!is_dir($productDir)) {
                    if (!mkdir($productDir, 0777, true)) {
                        echo "Không thể tạo thư mục: " . $productDir . "<br>";
                    }
                }


                $imagePath = $productDir . uniqid() . '-' . basename($imageFile);

                if (move_uploaded_file($imageTmpName, $imagePath)) {
                    $stmt = $pdo->prepare("UPDATE products SET Image = :image WHERE id = :productID");
                    $stmt->execute([":image" => $imagePath, ":productID" => $productID]);
                } else {
                    echo "Lỗi khi tải ảnh lên cho sản phẩm Máy tính bảng.<br>";
                }
            }
        }

        $pdo->commit();
        header("Location: ../product.php");
    } catch (Exception $e) {

        $pdo->rollBack();
        echo "Lỗi: " . $e->getMessage();
    }
}
?>
