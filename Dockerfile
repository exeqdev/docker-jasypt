# syntax=docker/dockerfile:1
FROM docker.io/openjdk:11.0-slim
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get -y install -qq wget unzip \
   && cd $(mktemp -d) && wget 'https://github.com/jasypt/jasypt/releases/download/jasypt-1.9.3/jasypt-1.9.3-dist.zip' -O jasypt-1.9.3-dist.zip \
   && unzip ./jasypt-1.9.3-dist.zip && chmod a+x jasypt-1.9.3/bin/*.sh \
   && mkdir /jasypt && mv jasypt-1.9.3/* /jasypt && rm jasypt-1.9.3-dist.zip \
   && apt-get clean &&  apt-get autoclean && rm -rf /var/lib/apt/lists/* 
WORKDIR /jasypt/bin
ENV PATH="/jasypt/bin:${PATH}" 
CMD ["/bin/bash"]