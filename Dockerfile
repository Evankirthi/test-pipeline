FROM nginx:1.21.3-alpine

COPY nginx/default.conf /etc/nginx/conf.d/


COPY build/ /usr/share/nginx/html/
#RUN rm -rf /usr/share/nginx/html/config || true