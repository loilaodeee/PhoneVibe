<?php
require "../../../config.php";


if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $email = $_POST['email'];
    $roleID = $_POST['RoleID'];
    $username = $_GET['id'];  
    $fullname=$_POST['FullName'];
    $phone=$_POST['Phone'];
    $address=$_POST['Address'];
    $user_status=$_POST['user_status'];

    if (empty($email) || empty($roleID) || empty($username)) {
        echo "Vui lòng điền đầy đủ thông tin.";
    } else {
        try {
            $sql = "UPDATE users SET Email = :email, FullName=:fullname, Phone=:phone, Address=:address, user_status=:user_status, RoleID = :roleID WHERE Username = :username";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([':email' => $email,':fullname'=>$fullname,':phone'=>$phone,':address'=>$address,':user_status'=>$user_status ,':roleID' => $roleID, ':username' => $username]);
            header("Location: ../user.php"); 
            exit();  
        } catch (PDOException $e) {
            echo "Lỗi khi cập nhật: " . $e->getMessage();
        }
    }
}
?>
