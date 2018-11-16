FROM node:8.12

RUN mkdir -p /appsync
WORKDIR /appsync

RUN apt-get update && \
    apt-get install -y build-essential bzip2 default-jre g++ \
    libkrb5-dev libzmq3-dev make python2.7 zip unzip

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | \
    tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

COPY . .
RUN yarn

EXPOSE 62222
CMD ["yarn", "start"]
