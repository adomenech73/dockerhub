### In nginx.sh (make sure this file is chmod +x):
#!/bin/sh
# `/sbin/setuser nginx` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
exec /sbin/setuser nginx /usr/sbin/nginx -t -c /etc/nginx/nginx.conf >>/var/log/nginx.log 2>&1
