FROM	hwen80/base-alpine

RUN	apk add --no-cache nginx && \
	mkdir /run/nginx && \
	touch /run/nginx/nginx.pid

COPY	boot.sh /
COPY	default.conf /etc/nginx/conf.d/
COPY	index.html /var/www/html/index.html

VOLUME [ "/etc/nginx/conf.d/" ]
VOLUME [ "/var/www/html/" ]

EXPOSE 80

ENTRYPOINT [ "/sbin/tini", "-e 143", "--" ]
CMD [ "/boot.sh" ]
