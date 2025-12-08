# базовый образ
FROM node:alpine

# рабочая директория в контейнере
WORKDIR /app

# копируем только package.json так-как после команды npm install 
# package-lock.json будет создан на месте
COPY package.json ./

# скачиваем зависимости приложения на основе package.json
RUN npm install

# копируем файлы приложения в рабочую директорию /app
COPY . .

# запускаем приложение в файле server.js
CMD [ "node", "server.js" ]

# указываем порт на котором будет запущено приложение в контейнере
EXPOSE 3000