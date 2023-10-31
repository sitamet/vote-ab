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

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar Nginx y mantener el contenedor en ejecución
CMD ["nginx", "-g", "daemon off;"]
