FROM phusion/baseimage:latest

CMD ["/sbin/my_init"]

# Common dependencies
RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get install -y --no-install-recommends \
  wget \
  libavahi-client3 \
  libavahi-common3 \
  libflac8 \
  libogg0 \
  libvorbis0a \
  libvorbisenc2 \
  git \
  build-essential \
  curl \
  binutils \
  libasound2-dev \
  libasound2-plugins \
  alsa-base \
  alsa-utils

# Configure Librespot
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin/:${PATH}"

RUN mkdir /build
ENV CARGO_TARGET_DIR /build
ENV CARGO_HOME /build/cache

ADD librespot /src

WORKDIR /src
RUN cargo build --release --no-default-features --features "alsa-backend"
RUN cp /build/release/librespot /usr/bin/librespot
RUN rm -r /build /root/.cargo /src

RUN mkdir /cache
RUN mkdir /etc/service/librespot
ADD librespot.sh /etc/service/librespot/run

# Configure ALSA
ADD asound.conf /etc

# Configure SnapServer
RUN wget https://github.com/badaix/snapcast/releases/download/v0.12.0/snapserver_0.12.0_amd64.deb
RUN dpkg -i snapserver_0.12.0_amd64.deb

RUN mkdir /etc/service/snapserver
ADD snapserver.sh /etc/service/snapserver/run

RUN mkdir /var/lib/snapserver
RUN chown snapserver:snapserver /var/lib/snapserver

EXPOSE 1704
EXPOSE 1705

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
