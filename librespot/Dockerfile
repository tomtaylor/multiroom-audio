FROM phusion/baseimage:latest

CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install -y curl git build-essential libpulse-dev pulseaudio-utils

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin/:${PATH}"

RUN mkdir /build
ENV CARGO_TARGET_DIR /build
ENV CARGO_HOME /build/cache

ADD src /src

WORKDIR /src
RUN cargo build --release --no-default-features --features "pulseaudio-backend"
RUN cp /build/release/librespot /usr/bin/librespot
RUN rm -r /build /root/.cargo /src

COPY pulse-client.conf /etc/pulse/client.conf

RUN mkdir /cache

RUN mkdir /etc/service/librespot
ADD librespot.sh /etc/service/librespot/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
