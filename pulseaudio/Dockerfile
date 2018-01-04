FROM phusion/baseimage:latest

CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install -y pulseaudio pulseaudio-utils

COPY system.pa /etc/pulse/system.pa
COPY daemon.conf /etc/pulse/daemon.conf
COPY client.conf /etc/pulse/client.conf

RUN mkdir /etc/service/pulseaudio
ADD pulseaudio.sh /etc/service/pulseaudio/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
