FROM nginx:1.22

ARG USER_NAME USER_UID USER_GID TZ

# Устанавливаем временной пояс
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Добавляем пользователя
RUN groupadd --gid $USER_GID $USER_NAME \
  && useradd --uid $USER_GID --gid $USER_GID --shell /bin/bash --create-home $USER_NAME
