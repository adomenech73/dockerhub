### In grafana.sh (make sure this file is chmod +x):
#!/bin/sh
# `/sbin/setuser grafana` runs the given command as the user `grafana`.
# If you omit that part, the command will be run as root.
exec /sbin/setuser grafana /usr/sbin/grafana-server \
	-config="/etc/grafana/grafana.ini" \
	-homepath="/usr/share/grafana" \
	-pidfile="/var/run/grafana-server.pid" >>/var/log/grafana.log 2>&1
	