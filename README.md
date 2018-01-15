# Multiroom Audio Server

This is a pair of Docker containers that run a multiroom audio system with Spotify Connect support. There's a server that runs [Librespot](https://github.com/plietar/librespot) (and could be extended to run anything else), which streams to clients using [Snapcast](https://github.com/badaix/snapcast).

## Server

The server is designed to run on `x86-64`, although could probably be ported to `armhf` for a Raspberry Pi. It combines ALSA pointing to a Snapcast server, with Librespot for Spotify support.

Copy `librespot.env.example` to `librespot.env` and fill out with your own Spotify account details. Then run `docker-compose build` and `docker-compose up` to run it.

You can also run it as a straight Docker image.

## Client

The client is designed for `armhf` (Raspberry Pi), and implements a Snapcast client on top of ALSA. Configure the `SNAPCLIENT_HOST` environment variable to point at the server's IP/hostname.

I run this on top of [ResinOS](https://resinos.io), but it should work on any host OS with a correctly configured sound system.
