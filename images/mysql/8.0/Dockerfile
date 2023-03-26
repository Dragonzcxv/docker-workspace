FROM mysql:8.0

ARG TZ

# Устанавливаем временной пояс
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
