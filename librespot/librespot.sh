#!/bin/sh
export PULSE_LATENCY_MSEC=60
export RUST_BACKTRACE=1
exec /usr/bin/librespot --username "$SPOTIFY_USERNAME" --password "$SPOTIFY_PASSWORD" --cache /cache --bitrate $SPOTIFY_BITRATE --name "$SPOTIFY_NAME"
