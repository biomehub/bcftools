FROM alpine:3.13.2
MAINTAINER lfelipedeoliveira, felipe@biome-hub.com

ENV APP_NAME=bcftools
ENV VERSION=1.11

#RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/testing'  >> /etc/apk/repositories

RUN apk add build-base py-pip jpeg-dev zlib-dev gcc g++ make perl bzip2-dev xz-dev

# Download & install
 RUN wget https://github.com/samtools/bcftools/releases/download/$VERSION/bcftools-$VERSION.tar.bz2 \
  && tar -xvjf bcftools-$VERSION.tar.bz2 \
  && cd bcftools-$VERSION \
  && ./configure --without-curses \
  && make \
  && make install \
  && cd / \
  && rm -r /bcftools-$VERSION
