FROM	hwen80/base-alpine

RUN	apk add nginx && \
	mkdir /run/nginx && \
	touch /run/nginx/nginx.pid

COPY	boot.sh /
COPY	default.conf /etc/nginx/conf.d/
COPY	index.html /var/www/html/index.html

ENTRYPOINT [ "/sbin/tini", "-e 143", "--" ]
CMD [ "/boot.sh" ]
