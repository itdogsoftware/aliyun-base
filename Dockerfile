FROM debian:bullseye

LABEL authors = "Roy To <roy.to@itdogsoftware.co>"

# Install library & necessary service
RUN curl -SLO "https://aliyuncli.alicdn.com/aliyun-cli-linux-latest-amd64.tgz"
RUN tar -xvzf aliyun-cli-linux-latest-amd64.tgz
RUN rm aliyun-cli-linux-latest-amd64.tgz
RUN mv aliyun /usr/local/bin/
RUN apt-get update -y && apt-get install curl gpg openssh-client docker.io -y && rm -rf /var/lib/apt/lists/*
