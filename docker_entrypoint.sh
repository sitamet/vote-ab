#!/bin/sh
# Reemplazar el puerto 80 con la variable de entorno PORT de Heroku
sed -i 's/listen  .*;/listen '"$PORT"';/' /etc/nginx/conf.d/default.conf

# Iniciar Nginx
nginx -g 'daemon off;'
