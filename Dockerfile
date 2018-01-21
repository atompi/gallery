FROM ubuntu:16.04

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

# install glibc.i686
RUN apt-get install glibc.i686

WORKDIR /app/gallery

ADD . /app/gallery/

# cnpm install
cnpm install

# startup
ENTRYPOINT ["npm", "run", "start"]
