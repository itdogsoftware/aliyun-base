FROM debian:bullseye

LABEL authors = "Roy To <roy.to@itdogsoftware.co>"

# Install library & necessary service
RUN apt-get update -y && apt-get install zip curl gpg openssh-client docker.io -y && rm -rf /var/lib/apt/lists/*
# add docker-compose plugin
RUN curl -SL "https://github.com/docker/compose/releases/download/v2.30.3/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
# Add nvm default node 18
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && bash -c "source ~/.bashrc && nvm install 18"
# install aliyun cli
RUN curl -SLO "https://aliyuncli.alicdn.com/aliyun-cli-linux-latest-amd64.tgz"
RUN tar -xvzf aliyun-cli-linux-latest-amd64.tgz
RUN rm aliyun-cli-linux-latest-amd64.tgz
RUN mv aliyun /usr/local/bin/
