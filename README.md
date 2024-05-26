Сборка Docker контейнера с nginx. Nginx собран из исходников.
Для запска контейнера используем: docker run -ti -v $(pwd)/nginx.conf:/usr/local/nginx/conf/nginx.conf --name=nginx_jw -d -p 8000:80 nginxjw:v2
