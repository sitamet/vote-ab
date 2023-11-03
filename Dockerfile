# Establecer la imagen base
FROM node:21-alpine as build-stage

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los archivos de definición de dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto de los archivos del proyecto
COPY . .

# Construir la aplicación para producción
ARG VITE_VOTE_AB_SERVER
ENV VITE_VOTE_AB_SERVER $VITE_VOTE_AB_SERVER
RUN npm run build

# Etapa de producción con Nginx
FROM nginx:stable-alpine as production-stage

# Copiar el build de Vue al directorio de Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Reemplazar el puerto predeterminado de Nginx por el puerto que Heroku asigna
CMD sed -i 's/listen       80;/listen       $PORT;/' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
