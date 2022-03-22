FROM centos:7

# hadolint ignore=DL3008
RUN yum -y update \
   && yum groupinstall -y 'Development Tools' \
   && yum install -y procps-ng curl file

# For git:
RUN yum install -y zlib-devel
# For curl:
RUN yum install -y openssl-devel

ADD test.sh test.sh
RUN chmod +x test.sh

RUN ["/bin/bash", "test.sh"]
