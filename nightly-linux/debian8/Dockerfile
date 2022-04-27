FROM debian/eol:jessie
ARG DEBIAN_FRONTEND=noninteractive

# hadolint ignore=DL3008
RUN apt-get update \
   && apt-get install -y build-essential procps curl file

RUN curl -sL http://mirrors.edge.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz | tar xz \
    && cd /git-2.28.0 \
    && make configure \
    && ./configure --prefix=/usr/local --with-curl=/usr/local/ \
    && make install NO_TCLTK=1 \
    && cd / \
    && rm -rf /git-2.28.0

ENV HOMEBREW_GIT_PATH=/usr/local/bin/git

RUN useradd -m -s /bin/bash linuxbrew
RUN echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
RUN su - linuxbrew -c 'mkdir ~/.linuxbrew'

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN chown -R linuxbrew /home/linuxbrew/.linuxbrew

RUN echo "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> /home/linuxbrew/.bashrc

RUN echo "export HOMEBREW_GIT_PATH=/usr/local/bin/git" >> /home/linuxbrew/.bashrc
# This is necessary so that HOMEBREW_GIT_PATH and HOMEBREW_CURL_PATH are picked up by brew:
RUN echo "export HOMEBREW_DEVELOPER=1" >> /home/linuxbrew/.bashrc
