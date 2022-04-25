FROM centos:8.4

# hadolint ignore=DL3008
RUN yum -y update \
   && yum groupinstall -y 'Development Tools' \
   && yum install -y procps-ng curl file

RUN useradd -m -s /bin/bash linuxbrew
RUN echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
RUN su - linuxbrew -c 'mkdir ~/.linuxbrew'

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN chown -R linuxbrew /home/linuxbrew/.linuxbrew

RUN echo "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> /home/linuxbrew/.bashrc
