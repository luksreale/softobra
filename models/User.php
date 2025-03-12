<?php
require_once '../config/database.php';

class User {
    private $pdo;

    public function __construct() {
        global $pdo;
        $this->pdo = $pdo;
    }

    public function register($nombre, $email, $password, $id_empresa) {
        // Verificar si el email ya existe
        $stmt = $this->pdo->prepare("SELECT id_usuario FROM usuarios WHERE email = ?");
        $stmt->execute([$email]);
        if ($stmt->fetch()) {
            return false; // Email ya registrado
        }

        // Hashear la contraseña
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Insertar usuario
        $stmt = $this->pdo->prepare("INSERT INTO usuarios (nombre, email, password, id_empresa) VALUES (?, ?, ?, 1)");
        return $stmt->execute([$nombre, $email, $hashedPassword, $id_empresa]);
    }
}
?>
