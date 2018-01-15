#!/bin/sh
exec /sbin/setuser snapserver /usr/bin/snapserver --stream "pipe:///tmp/snapfifo?name=default&sampleformat=48000:16:2"
