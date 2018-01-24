FROM ubuntu:16.04

MAINTAINER AtomPi <atomissionpi@gmail.com>

# prepare
COPY sources.list /etc/apt/sources.list
RUN echo "nameserver 114.114.114.114" >> /etc/resolv.conf
RUN apt-get update

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

# install glibc.i686
RUN apt-get install gcc make glibc.i686
RUN apt-get autoremove
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /app/gallery

ADD . /app/gallery/

# cnpm install
RUN cnpm install

# startup
ENTRYPOINT ["npm", "run", "start"]
