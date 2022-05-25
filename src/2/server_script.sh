#!/bin/bash
#service nginx start
gcc miniserver.c -lfcgi -o miniserver
spawn-fcgi -p 8080 ./miniserver
nginx -g "daemon off;"
