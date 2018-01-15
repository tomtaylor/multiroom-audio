#!/bin/sh
export PULSE_LATENCY_MSEC=60 
exec /usr/bin/pulseaudio --daemonize=no --system --disallow-module-loading --disallow-exit --realtime --log-target=syslog
