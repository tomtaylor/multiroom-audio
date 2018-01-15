#!/bin/sh
exec /sbin/setuser snapserver /usr/bin/snapserver --stream "pipe:///tmp/snapfifo.sock?name=default&mode=read&sampleformat=48000:16:2"
