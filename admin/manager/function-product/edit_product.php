<?php
require_once '../../../config.php';


if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $productName = $_POST['product_name'];
    $productDescription = $_POST['product_description'];
    $productPrice = $_POST['product_price'];
    $categoryID = $_POST['category'];
    $brandID = $_POST['brand'];
    $colors = isset($_POST['colors']) ? $_POST['colors'] : [];
    $stock = $_POST['stock'];
    $productID = $_GET['id'];  

    $stmt = $pdo->prepare("SELECT BrandName FROM brands where id = :BrandID");
    $stmt->execute([":BrandID"=>$brandID]);

    $brandRow = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($brandRow) {
        $brandName=$brandRow['BrandName'];
    }

    $colors = array_filter($colors, function($color) {
        return !empty(trim($color));  
    });

    if (empty($colors)) {
        echo "Không có màu sắc hợp lệ được chọn.";
        exit;
    }

    try {

        $pdo->beginTransaction();

        $stmt = $pdo->prepare("UPDATE products SET ProductName = :productName, Description = :productDescription, Price = :productPrice, BrandID = :brandID, CategoryID = :categoryID WHERE id = :productID");
        $stmt->execute([
            ":productName" => $productName,
            ":productDescription" => $productDescription,
            ":productPrice" => $productPrice,
            ":brandID" => $brandID,
            ":categoryID" => $categoryID,
            ":productID" => $productID
        ]);

        foreach ($colors as $colorName) {
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
        }


        if (!empty($_FILES['images']['name'][0])) {
            $imageFiles = $_FILES['images'];
            $imageCount = count($imageFiles['name']);
            $uploadDir = "../../img/";

            switch($brandID){
                case "1":
                    $uploadDir .= "samsung/";
                    break;
                case "2":
                    $uploadDir .= "iphone/";
                    break;
                case "3":
                    $uploadDir .= "xiaomi/";
                    break;
                case "4":
                    $uploadDir .= "oppo/";
                    break;
                case "5":
                    $uploadDir .= "vivo/";
                    break;
                case "6":
                    $uploadDir .= "realme/";
                    break;
                default:
                    $uploadDir .= "others/";
                    break;
            }

            if (!is_dir($uploadDir)) {
                mkdir($uploadDir, 0777, true);
            }

            $productDir = $uploadDir . 'product_' . $productID . '/';
            if (!is_dir($productDir)) {
                mkdir($productDir, 0777, true);
            }

            $imageStmt = $pdo->prepare("SELECT Image FROM product_color_images WHERE ProductID = :productID");
            $imageStmt->execute([":productID" => $productID]);
            $oldImages = $imageStmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($oldImages as $oldImage) {
                $oldImagePath = $productDir . $oldImage['Image'];
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath); 
                }
            }

            $deleteImagesStmt = $pdo->prepare("DELETE FROM product_color_images WHERE ProductID = :productID");
            $deleteImagesStmt->execute([":productID" => $productID]);


            for ($i = 0; $i < $imageCount; $i++) {

                $imageName = uniqid() . '-' . basename($imageFiles['name'][$i]);
                $imagePath = $productDir . $imageName;

                if (move_uploaded_file($imageFiles['tmp_name'][$i], $imagePath)) {
                    foreach ($colors as $colorName) {
                        $colorStmt = $pdo->prepare("SELECT id FROM colors WHERE ColorName = :colorName");
                        $colorStmt->execute([":colorName" => $colorName]);
                        $colorRow = $colorStmt->fetch(PDO::FETCH_ASSOC);

                        if ($colorRow) {
                            $colorID = $colorRow['id'];
                        }

                        $imageRelativePath = '../../img/' . strtolower($brandName) . '/product_' . $productID . '/' . $imageName;
  
                        $stmt = $pdo->prepare("INSERT INTO product_color_images (ProductID, ColorID, Image) 
                                               VALUES (:productID, :colorID, :image)");
                        $stmt->execute([":productID" => $productID, ":colorID" => $colorID, ":image" => $imageRelativePath]);
                    }
                } else {
                    echo "Lỗi khi tải ảnh: " . $imageFiles['name'][$i] . "<br>";
                }
            }
        }

        $pdo->commit();
        header("Location: ../product.php");

    } catch (Exception $e) {

        $pdo->rollBack();
        echo "Có lỗi xảy ra: " . $e->getMessage();
    }
}
?>
