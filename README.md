Рабочее пространство из docker контейнеров
====

Описание
----
Состоит из следующих образов:
1. php(fpm): 7.3, 7.4, 8.0, 8.2, 8.3
2. node: 18, 20
3. mysql: 8.0, 5.7
4. nginx: 1.22
5. mariadb: 10.3
6. selenium chomedriver (автономный сервер, который использует протокол провода WebDriver для Chromium. Используется например для написания парсеров)

В php и node контейнерах пользователям присваиваются uid и gid, которые указываются в файле .env. Это позволяет избежать мучений с правами между хост-системой и контейнерами.

Использование
----
1. Устанавливаем docker и docker-compose
2. Клонируем проект
3. Настраиваем .env файл исходя из .env-example
4. В projects создаём свой проект.
5. В nginx добавляем конфиг для своего проекта
6. Прописываем в hosts имя своего домена
7. Собираем контейнеры(docker compose build)
8. Запускать можно через bash скрипт (он учитывает активность в .env)
```bash
bash compose-up.sh
```

Готово! Можно работать.
