FROM node:20

ARG USER_UID USER_GID TZ

# Устанавливаем временной пояс
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Меняем uid и gid пользователя node(создаётся автоматически в контейнере)
RUN usermod  --uid $USER_UID node
RUN groupmod --gid $USER_GID node
