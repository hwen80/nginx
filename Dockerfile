FROM	hwen80/base-alpine

RUN	apk add --no-cache nginx && \
	mkdir /run/nginx && \
	touch /run/nginx/nginx.pid

COPY	default.conf /etc/nginx/conf.d/
COPY	index.html /var/www/html/index.html

VOLUME [ "/etc/nginx/conf.d/" ]
VOLUME [ "/var/www/html/" ]

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
