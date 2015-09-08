### In influxdb.sh (make sure this file is chmod +x):
#!/bin/sh
# `/sbin/setuser influxdb` runs the given command as the user `influxdb`.
# If you omit that part, the command will be run as root.
exec /sbin/setuser influxdb /opt/influxdb/influxd >>/var/log/influxdb.log 2>&1
