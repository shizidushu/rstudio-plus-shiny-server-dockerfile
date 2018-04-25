FROM shizidushu/rstudio-plus-shiny-server:base

# refer to https://hub.docker.com/r/starefossen/node-imagemagick/~/dockerfile/

ENV MAGICK_URL "http://imagemagick.org/download/releases"
ENV MAGICK_VERSION 7.0.7-26

RUN apt-get update -y \
  && apt-get install -y curl xz-utils \
  && cd /tmp \
  && curl -SLO "${MAGICK_URL}/ImageMagick-${MAGICK_VERSION}.tar.xz" \
  && tar xf "ImageMagick-${MAGICK_VERSION}.tar.xz" \
  
# http://www.imagemagick.org/script/advanced-unix-installation.php#configure
  && cd "ImageMagick-${MAGICK_VERSION}" \
  && ./configure \
    --disable-static \
    --enable-shared \
    --with-gslib \
    --with-jpeg \
    --with-openjp2 \
    --with-png \
    --with-tiff \
    --with-quantum-depth=8 \
  && make \
  && make install \
  && ldconfig /usr/local/lib \
  && cd / \
  && apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
