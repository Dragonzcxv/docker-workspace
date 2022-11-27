FROM node:18

ARG USER_NAME USER_UID USER_GID TZ

# Устанавливаем временной пояс
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Удаляем стандартного нодовсково пользователя
RUN userdel node

# Добавляем пользователя
RUN groupadd --gid $USER_GID $USER_NAME \
  && useradd --uid $USER_GID --gid $USER_GID --shell /bin/bash --create-home $USER_NAME
