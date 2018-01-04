FROM phusion/baseimage:latest

CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install -y wget libavahi-client3 libavahi-common3 libflac8 libogg0 libvorbis0a libvorbisenc2
RUN wget https://github.com/badaix/snapcast/releases/download/v0.12.0/snapserver_0.12.0_amd64.deb
RUN dpkg -i snapserver_0.12.0_amd64.deb

RUN mkdir /etc/service/snapserver
ADD snapserver.sh /etc/service/snapserver/run

RUN mkdir /var/lib/snapserver
RUN chown snapserver:snapserver /var/lib/snapserver

EXPOSE 1704 1704
EXPOSE 1705 1705

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
