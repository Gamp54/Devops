#!/bin/bash

gcc miniserver.c -o miniserver -lfcgi
spawn-fcgi -a 127.0.0.1 -p 8080 -f /home/miniserver
service nginx start