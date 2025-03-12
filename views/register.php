<?php
require_once '../controllers/AuthController.php';

// Obtener roles desde la base de datos
$roles = $auth->getRoles();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $auth->register(); 
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
</head>
<body>
    <h2>Registro</h2>
    <form action="register.php" method="POST">
        <label>Nombre:</label>
        <input type="text" name="nombre" required>
        <label>Email:</label>
        <input type="email" name="email" required>
        <label>Contraseña:</label>
        <input type="password" name="password" required>
        <label>Rol:</label>
        <select name="id_rol">
            <?php foreach ($roles as $rol): ?>
                <option value="<?php echo $rol['id_rol']; ?>"><?php echo $rol['nombre']; ?></option>
            <?php endforeach; ?>
        </select>
        <button type="submit">Registrarse</button>
    </form>
    <p>¿Ya tienes cuenta? <a href="login.php">Inicia sesión aquí</a></p>
</body>
</html>