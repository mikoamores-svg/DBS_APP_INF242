<?php

class database{
    function opencon(): PDO{
        return new PDO("mysql:host=localhost;
        dbname=242_LMS",
        username: "root", 
        password: "");
    }
    function insertUser($username, $user_password_hash, $is_active){
        $con = $this ->opencon();

        try{
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO Users (username,user_password_hash,created_at) 
            VALUES (?,?,?) ");
            $stmt->execute([$username,$user_password_hash,$is_active]);
            $user_id = $con->lastInsertId();
            $con->commit();
            return $user_id;
        }catch(PDOException $e) {
            if($con->inTransaction()) {
                $con->rollback();
            }
            throw $e;
        }
    }
}