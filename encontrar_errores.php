<?php

// se desea conectar a un servidor mysql en la IP 10.20.30.40
// desde el puerto 3306 e imprimir los códigos en una lista de html
// el usuario es user, la clave key y la base de datos testdb
// y la tabla laptops

ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
error_reporting(0);

// Conexión MySQL
$mysqli = new mysqli("10.20.30.40:3306", "user", "key", "testdb");
$mysqli->set_charset('utf8');
$mysqli->query('SET time_zone = "-05:00"');

// Consulta a DB
$tabla = "laptops";
$qry = $mysqli->query(
	"SELECT 
		codigo 
	FROM 
		$tabla"
);

// HTML códigos
$lista = "";
while($row = $qry->fetch_assoc()){
	$lista .= "<li>".$row['codigo']."</li>";
}

// HTML lista
echo "<ul>";
	echo $lista;
echo "</ul>";