#!/bin/bash

useradd -m -s /bin/bash linuxbrew
echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
su - linuxbrew -c 'mkdir ~/.linuxbrew'

curl -sL http://ftp.gnu.org/gnu/tar/tar-1.32.tar.gz | tar xz \
    && cd /tar-1.32 \
    && FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/usr/local \
    && make install \
    && cd / \
    && rm -rf /tar-1.32

curl -sL http://fresh-center.net/linux/www/curl-7.82.0.tar.bz2 | tar xj \
    && cd /curl-7.82.0 \
    && make configure \
    && ./configure --prefix=/usr/local --with-openssl \
    && make \
    && make install \
    && cd / \
    && rm -rf /curl-7.82.0

curl -sL http://mirrors.edge.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz | tar xz \
    && cd /git-2.28.0 \
    && make configure \
    && ./configure --prefix=/usr/local --with-curl=/usr/local \
    && make install NO_TCLTK=1 \
    && cd / \
    && rm -rf /git-2.28.0

export HOMEBREW_GIT_PATH=/usr/local/bin/git
export HOMEBREW_CURL_PATH=/usr/local/bin/curl
export HOMEBREW_FORCE_BREWED_CA_CERTIFICATES=1

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

useradd -m -s /bin/bash normaluser
chown -R normaluser /home/linuxbrew/

su normaluser -c 'echo "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> /home/normaluser/.bashrc'

su normaluser -c 'brew install hello'
su normaluser -c 'brew test hello'
