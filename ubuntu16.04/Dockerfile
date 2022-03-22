FROM ubuntu:16.04
ARG DEBIAN_FRONTEND=noninteractive

# hadolint ignore=DL3008
RUN apt-get update \
   && apt-get install -y build-essential procps curl file git

ADD test.sh test.sh
RUN chmod +x test.sh

RUN ["/bin/bash", "test.sh"]
