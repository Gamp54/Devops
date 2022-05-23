FROM nginx

RUN apt-get update && apt-get -y install \
 gcc \
 libfcgi-dev spawn-fcgi\
 && rm -rf /var/lib/apt/lists/*
COPY ./nginx/nginx.conf /etc/nginx/
COPY miniserver.c /home/
#COPY miniserver /home/
COPY server_script.sh /home/

WORKDIR /home/

#RUN spawn-fcgi -p 8080 -f /home/miniserver
ENTRYPOINT  ./server_script.sh
