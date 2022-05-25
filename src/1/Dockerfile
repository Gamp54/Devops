FROM nginx:latest

COPY ./nginx/nginx.conf /etc/nginx/
COPY ./server/miniserver.c /home/
COPY server_script.sh /home/

WORKDIR /home/

RUN apt-get update && apt-get -y install \
 gcc \
 libfcgi-dev spawn-fcgi\
 && rm -rf /var/lib/apt/lists/*
 

#RUN apt-get update && \
#      apt-get -y install sudo 

#RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN useradd -d /home/docker -m -s /bin/bash docker \ 
&& chown -R docker:docker /var/cache/nginx \ 
&& chown -R docker:docker /var/log/nginx \ 
&& chown -R docker:docker /etc/nginx/nginx.conf \ 
&& touch /var/run/nginx.pid \ 
&& chown -R docker:docker /var/run/nginx.pid \
&& chmod +x /home/server_script.sh \
&& chmod 777 /home \
&& chmod 755 /sbin/unix_chkpwd \
&& chmod u-s /usr/bin/chsh \ 
&& chmod u-g /usr/bin/chsh \ 
&& chmod 755 /usr/bin/chage \ 
&& chmod u-s /bin/su \ 
&& chmod u-g /bin/su \ 
&& chmod 755 /usr/bin/wall \ 
&& chmod u-s /usr/bin/chfn \ 
&& chmod u-g /usr/bin/chfn \ 
&& chmod u-s /usr/bin/gpasswd \ 
&& chmod u-g /usr/bin/gpasswd \ 
&& chmod u-s /bin/mount \ 
&& chmod u-g /bin/mount \ 
&& chmod u-s /usr/bin/newgrp \ 
&& chmod u-g /usr/bin/newgrp \ 
&& chmod 755 /usr/bin/expiry \ 
&& chmod u-s /bin/umount \ 
&& chmod u-g /bin/umount \
&& chmod u-s /usr/bin/passwd \
&& chmod u-g /usr/bin/passwd

USER docker

#RUN spawn-fcgi -p 8080 -f /home/miniserver
ENTRYPOINT  ./server_script.sh

HEALTHCHECK --timeout=10s CMD curl --silent --fail localhost:81/status