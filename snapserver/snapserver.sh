#!/bin/sh
if [ -d /var/run/snapfifo ]; then
  rm /var/run/snapfifo/snapfifo.sock || true
fi
exec /sbin/setuser snapserver /usr/bin/snapserver --stream "pipe:///var/run/snapfifo/snapfifo.sock?name=default&mode=read&sampleformat=48000:16:2"
