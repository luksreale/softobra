<?php
class AuthController {
    private $db;

    public function __construct($database) {
        $this->db = $database;
    }

    public function login() {
        session_start();
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $email = $_POST['email'];
            $password = sha1($_POST['password']);

            $stmt = $this->db->prepare("SELECT * FROM usuarios WHERE email = ? AND password = ?");
            $stmt->execute([$email, $password]);
            $user = $stmt->fetch();

            if ($user) {
                $_SESSION['user_id'] = $user['id_usuario'];
                $_SESSION['user_name'] = $user['nombre'];
                $_SESSION['user_role'] = $user['id_rol'];
                header("Location: dashboard.php");
                exit();
            } else {
                echo "<p style='color:red;'>Credenciales incorrectas</p>";
            }
        }
    }

    public function register() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $nombre = $_POST['nombre'];
            $email = $_POST['email'];
            $password = sha1($_POST['password']); 
            $id_rol = $_POST['id_rol'] ?? 3; // Profesional por defecto

            // Asignar empresa por defecto basada en el email del usuario
            $id_empresa = $this->getEmpresaIdPorEmail($email);

            $stmt = $this->db->prepare("INSERT INTO usuarios (nombre, email, password, id_empresa, id_rol) VALUES (?, ?, ?, ?, ?)");
            $success = $stmt->execute([$nombre, $email, $password, $id_empresa, $id_rol]);

            if ($success) {
                // Obtener el ID del usuario recién creado
                $id_usuario = $this->db->lastInsertId();

                // Asignar permiso por defecto al usuario
                $this->asignarPermiso($id_usuario, 1); // Asignar permiso por defecto

                echo "Registro exitoso. <a href='login.php'>Inicia sesión</a>";
            } else {
                echo "<p style='color:red;'>Error en el registro</p>";
            }
        }
    }

    public function getRoles() {
        $stmt = $this->db->prepare("SELECT id_rol, nombre FROM roles");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    private function getEmpresaIdPorEmail($email) {
        // Lógica para obtener la empresa por defecto basada en el email
        // Esta es solo un ejemplo, deberás ajustar la lógica según tu necesidad
        return 1; // Id de empresa por defecto
    }

    private function asignarPermiso($id_usuario, $id_permiso) {
        $stmt = $this->db->prepare("INSERT INTO permisos_usuarios (id_usuario, id_permiso) VALUES (?, ?)");
        $stmt->execute([$id_usuario, $id_permiso]);
    }
}

require_once '../config/database.php';
$auth = new AuthController($pdo);
?>