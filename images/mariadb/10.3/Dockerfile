FROM mariadb:10.3

ARG TZ

# Устанавливаем временной пояс
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
