<?php
$conn = mysqli_connect("mysql\-8", "root", "root");

if ($conn === false) {
  die("Ошибка: " . mysqli_connect_error());
} 

echo "Подключение успешно установлено";
mysqli_close($conn);