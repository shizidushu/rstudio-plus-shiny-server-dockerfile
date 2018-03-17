FROM shizidushu/rstudio-shiny:base


### http://blog.csdn.net/gxp/article/details/26563579
# Fix package dependency & git chinese character path

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
        imagemagick \
        libglu1-mesa-dev \
        libmariadb-client-lgpl-dev \
        libssh2-1-dev \
        libtool \
        libudunits2-dev \
        libx11-dev \
        libxml2-dev \
        m4 \
        nginx \
        unixodbc-dev \
    && git config --global core.quotepath false \
    && git config --global gui.encoding utf-8 \
    && git config --global i18n.commit.encoding utf-8 \
    && git config --global i18n.logoutputencoding utf-8 \
    && export LESSCHARSET=utf-8 \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*



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
    

### https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server    
### https://github.com/Microsoft/mssql-docker/blob/master/linux/mssql-tools/Dockerfile
# adding custom MS repository
# install SQL Server drivers and tools

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
  && apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql mssql-tools \
  && echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc \
  && /bin/bash -c "source ~/.bashrc"

