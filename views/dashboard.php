<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: views/login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
</head>
<body>
    <h2>Bienvenido, <?php echo $_SESSION['user_name']; ?></h2>
    <p>Rol: <?php echo $_SESSION['user_role']; ?></p>
    <a href="logout.php">Cerrar sesión</a>
</body>
</html>
