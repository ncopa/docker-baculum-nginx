FROM alpine:edge

# Install packages
RUN apk --repository http://dl-master.alpinelinux.org/alpine/edge/testing \
	add baculum-web nginx php7-fpm supervisor \
	php7-dom bash curl \
	lighttpd baculum-api-lighttpd baculum-api \
	&& ls -al

RUN apk upgrade -U -a \
	&& echo "alias ll='ls -al' > /root/.bashrc"

# Configure nginx
COPY config/baculum-web-nginx.conf /etc/nginx/conf.d/baculum-web.conf
COPY config/00-nginx-logs.conf /etc/nginx/conf.d/00-nginx-logs.conf
COPY user-preferences/basrc /root/.bashrc
# Remove default server definition
RUN rm /etc/nginx/conf.d/default.conf

RUN install -d -o nginx -g nginx /run/nginx

# set group permission of php-fpm to www-data
RUN sed -i -e 's/^group =.*/group = www-data/' /etc/php7/php-fpm.d/www.conf

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose the port nginx is reachable on
EXPOSE 9095

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
