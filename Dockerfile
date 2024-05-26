FROM debian:11 as build
RUN apt update && apt install -y wget gcc make libpcre++-dev zlib1g-dev
RUN wget http://nginx.org/download/nginx-1.25.5.tar.gz && tar xvzf nginx-1.25.5.tar.gz && cd nginx-1.25.5 && ./configure && make && make install

FROM debian:11
WORKDIR /usr/local/nginx/sbin
COPY --from=build /usr/local/nginx/sbin/nginx .
RUN mkdir ../logs ../conf && chmod +x nginx
COPY --from=build /usr/local/nginx/conf/mime.types /usr/local/nginx/conf/mime.types
CMD ["./nginx", "-g", "daemon off;"]
