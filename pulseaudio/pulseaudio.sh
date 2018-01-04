#!/bin/sh
if [ -d /var/run/pulseserver ]; then
  rm /var/run/pulseserver/pulseserver.sock || true
fi
exec /usr/bin/pulseaudio --daemonize=no --system --disallow-module-loading --disallow-exit --realtime --log-target=syslog
