<?php

class database{
    function opencon(): PDO{
        return new PDO("mysql:host=localhost;
        dbname=242_LMS",
        username: "root", 
        password: "");
    }
    function insertUser($username, $password_hash, $is_active){
        $con = $this ->opencon();

        try{
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO Users (username,password_hash,created_at) 
            VALUES (?,?,?) ");
            $stmt->execute([$username,$password_hash,$is_active]);
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

    function insertborrowers($firstname, $lastname, $email, $phone, $member_since, $is_active){

        $con = $this ->opencon();

        try{
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO borrowers (borrower_firstname, borrower_lastname, borrower_email, borrower_phone_number, borrower_member_since, is_active) 
            VALUES (?,?,?,?,?,?) ");
            $stmt->execute([$firstname, $lastname, $email, $phone, $member_since, $is_active]);
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
    function insertBorrowerUser($borrower_id, $user_id) {
        $con = $this ->opencon();

        try{
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO BorrowerUser (borrower_id, user_id) 
            VALUES (?,?) ");
            $stmt->execute([$borrower_id,$user_id]);
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