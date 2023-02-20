<?php
session_start();
if (empty($_SESSION['active'])) {
	header('location: ../');
}
include "includes/functions.php";
include "../conexion.php";
// datos Empresa
$identificacion = '';
$nombre_empresa = '';
$razonSocial = '';
$emailEmpresa = '';
$telEmpresa = '';
$dirEmpresa = '';

$query_empresa = mysqli_query($conexion, "SELECT * FROM configuracion");
$row_empresa = mysqli_num_rows($query_empresa);
if ($row_empresa > 0) {
	if ($infoEmpresa = mysqli_fetch_assoc($query_empresa)) {
		$nombre_empresa = $infoEmpresa['nombre'];
		$razonSocial = $infoEmpresa['razon_social'];
		$telEmpresa = $infoEmpresa['telefono'];
		$emailEmpresa = $infoEmpresa['email'];
		$dirEmpresa = $infoEmpresa['direccion'];
	}
}
$query_data = mysqli_query($conexion, "CALL data();");
$result_data = mysqli_num_rows($query_data);
if ($result_data > 0) {
	$data = mysqli_fetch_assoc($query_data);
}
?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Clientes - Prueba</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">
	<!-- Bootstrap CSS-->
	<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
	<!-- Custom Font Icons CSS-->
	<link rel="stylesheet" href="css/font.css">
	<!-- Google fonts - Muli-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,700">
	<!-- theme stylesheet-->
	<link rel="stylesheet" href="css/style.violet.css" id="theme-stylesheet">
	<!-- Custom stylesheet - for your changes-->
	<link rel="stylesheet" href="css/custom.css">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/favicon.ico">

</head>

<body>
	<?php
	include "../conexion.php";
	$query_data = mysqli_query($conexion, "CALL data();");
	$result_data = mysqli_num_rows($query_data);
	if ($result_data > 0) {
		$data = mysqli_fetch_assoc($query_data);
	}

	?>

	<div class="d-flex align-items-stretch">
		<!-- Sidebar Navigation-->
		<nav id="sidebar">
			<!-- Sidebar Header-->
			<div class="sidebar-header d-flex align-items-center">
				<div ></div>
				<div class="title">
					<h1 class="h5"><?php echo $_SESSION['nombre']; ?></h1>
				
				</div>
			</div>
			<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
				<!-- Divider -->

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
						
						<span>Ventas</span>
						<i class="fas fa-angle-down fa-lg float-right"></i>
					</a>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="nueva_venta.php">Nueva venta</a>
							<a class="collapse-item" href="ventas.php">Ventas</a>
						</div>
					</div>
				</li>

				<!-- Nav Item - Productos Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
						
						<span>Productos</span>
						<i class="fas fa-angle-down fa-lg float-right"></i>
					</a>
					<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="registro_producto.php">Nuevo Producto</a>
							<a class="collapse-item" href="lista_productos.php">Productos</a>
						</div>
					</div>
				</li>

				<!-- Nav Item - Clientes Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseClientes" aria-expanded="true" aria-controls="collapseUtilities">
					
						<span>Clientes</span>
						<i class="fas fa-angle-down fa-lg float-right"></i>
					</a>
					<div id="collapseClientes" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="registro_cliente.php">Nuevo Clientes</a>
							<a class="collapse-item" href="lista_cliente.php">Clientes</a>
						</div>
					</div>
				</li>
				

			</ul>

		</nav>
		<!-- Sidebar Navigation end-->
		<div class="page-content">
			<div class="page-header">