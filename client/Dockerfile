FROM resin/armv7hf-debian:jessie

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  libasound2 \
  libatomic1 \
  libavahi-client3 \
  libavahi-common3 \
  libflac8 \
  libogg0 \
  libvorbis0a \
  init-system-helpers

ADD https://github.com/badaix/snapcast/releases/download/v0.12.0/snapclient_0.12.0_armhf.deb snapclient_0.12.0_armhf.deb
RUN dpkg -i snapclient_0.12.0_armhf.deb

ADD run.sh /run.sh

CMD /run.sh
