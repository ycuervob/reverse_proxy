  FROM nginx

  RUN apt-get update -qq && apt-get -y install apache2-utils
  ENV NODE_ROOT /var/www/api-gateway
  WORKDIR $NODE_ROOT
  RUN chmod 700 /etc/ssl/private
  RUN openssl req -x509 -nodes -days 365 \
    -subj  "/C=CO/ST=QC/O=Company Inc/CN=example.com" \
    -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt;
  RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
  RUN mkdir log
  COPY app.conf /tmp/app.nginx
  RUN envsubst '$NODE_ROOT' < /tmp/app.nginx > /etc/nginx/conf.d/default.conf

  EXPOSE 443

  CMD [ "nginx", "-g", "daemon off;" ]