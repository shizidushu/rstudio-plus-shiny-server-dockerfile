FROM shizidushu/rstudio-shiny:base

ENV MAGICK_URL "http://imagemagick.org/download/releases"
ENV MAGICK_VERSION 7.0.7-26

## Install linux packages

### https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server    
### https://github.com/Microsoft/mssql-docker/blob/master/linux/mssql-tools/Dockerfile
### https://download.microsoft.com/download/1/E/7/1E7B1181-3974-4B29-9A47-CC857B271AA2/Linux_Install_Instructions.pdf
## adding custom MS repository
## install SQL Server drivers and tools

### http://blog.csdn.net/gxp/article/details/26563579
# Fix package dependency & git chinese character path

# refer to https://hub.docker.com/r/starefossen/node-imagemagick/~/dockerfile/
# http://www.imagemagick.org/script/advanced-unix-installation.php#configure


RUN echo "deb http://ftp2.cn.debian.org/debian stretch main non-free contrib" >> /etc/apt/sources.list \
    && apt-get update && apt-get -y install \
        apache2-utils \
        apt-transport-https \
        autoconf \
        automake \
        cron \
        curl \
        debconf-utils \
        fonts-wqy-zenhei \
        gnupg1 \
        gnupg2 \
        libglu1-mesa-dev \
        libtool \
        libudunits2-dev \
        m4 \
        nginx \
        xz-utils \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get -y install msodbcsql17 \
    && ACCEPT_EULA=Y apt-get -y install mssql-tools \
    && echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile \
    && echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc \
    && /bin/bash -c "source ~/.bashrc" \
    && apt-get -y install unixodbc-dev \
    && git config --global core.quotepath false \
    && git config --global gui.encoding utf-8 \
    && git config --global i18n.commit.encoding utf-8 \
    && git config --global i18n.logoutputencoding utf-8 \
    && export LESSCHARSET=utf-8 \
    && gpg --keyserver pool.sks-keyservers.net --recv-keys 8277377A \
    && cd /tmp \
    && curl -SLO "${MAGICK_URL}/ImageMagick-${MAGICK_VERSION}.tar.xz" \
    && curl -SLO "${MAGICK_URL}/ImageMagick-${MAGICK_VERSION}.tar.xz.asc" \
    && gpg --verify "ImageMagick-${MAGICK_VERSION}.tar.xz.asc" "ImageMagick-${MAGICK_VERSION}.tar.xz" \
    && tar xf "ImageMagick-${MAGICK_VERSION}.tar.xz" \
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
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



# Add nginx to s6-init system
# Add cron to s6-init system

RUN mkdir -p /etc/services.d/nginx \
    && echo '#!/usr/bin/execlineb -P \
          \n nginx -g "daemon off;"' \
          > /etc/services.d/nginx/run \
    && mkdir -p /etc/services.d/cron \
    && echo '#!/bin/sh \
            \n exec cron -f' \
            > /etc/services.d/cron/run
