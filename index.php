<?php
session_start();
require_once __DIR__ . '/helpers/Session.php';

// Si el usuario está autenticado, redirige al dashboard
if (Session::get('user_id')) {
    header("Location: views/dashboard.php");
    exit();
}

// Si no está autenticado, redirige al login
header("Location: views/login.php");
exit();
?>
