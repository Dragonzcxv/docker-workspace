#!/bin/bash
source .env
comand="docker compose up"

# Проверяем nginx
if [ "$NGINX_ACTIVE" = "true" ]; then
  comand+=" nginx"
fi

# Проверяем php
if [ "$PHP_8_2_ACTIVE" = "true" ]; then
  comand+=" php-8.2"
fi

if [ "$PHP_8_0_ACTIVE" = "true" ]; then
  comand+=" php-8.0"
fi

if [ "$PHP_7_4_ACTIVE" = "true" ]; then
  comand+=" php-7.4"
fi

if [ "$PHP_7_3_ACTIVE" = "true" ]; then
  comand+=" php-7.3"
fi

# Проверяем node
if [ "$NODE_18_ACTIVE" = "true" ]; then
  comand+=" node-18"
fi

if [ "$NODE_20_ACTIVE" = "true" ]; then
  comand+=" node-20"
fi

# Проверяем mysql
if [ "$MYSQL_8_ACTIVE" = "true" ]; then
  comand+=" mysql-8"
fi

if [ "$MYSQL_5_7_ACTIVE" = "true" ]; then
  comand+=" mysql-5.7"
fi

# Проверяем mariadb
if [ "$MARIADB_13_0_ACTIVE" = "true" ]; then
  comand+=" mariadb-13.0"
fi

# Проверяем chromedriver
if [ "$CHROMEDRIVER_ACTIVE" = "true" ]; then
  comand+=" chromedriver"
fi

# Выполняем команду
$comand
