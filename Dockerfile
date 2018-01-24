FROM ubuntu:16.04

MAINTAINER AtomPi <atomissionpi@gmail.com>

# prepare
COPY sources.list /etc/apt/sources.list
RUN echo "nameserver 114.114.114.114" >> /etc/resolv.conf
RUN apt-get update

# install gcc-multilib
RUN apt-get install -y gcc make gcc-multilib curl
RUN apt-get -y autoremove
RUN rm -rf /var/lib/apt/lists/*

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

WORKDIR /app/gallery

ADD . /app/gallery/

# cnpm install
RUN cnpm install

# startup
ENTRYPOINT ["npm", "run", "start"]
