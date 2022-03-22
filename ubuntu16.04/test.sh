#!/bin/bash

useradd -m -s /bin/bash linuxbrew
echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
su - linuxbrew -c 'mkdir ~/.linuxbrew'

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

useradd -m -s /bin/bash normaluser
chown -R normaluser /home/linuxbrew/.linuxbrew/

su normaluser -c 'echo "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> /home/normaluser/.bashrc'

su normaluser -c 'brew install hello'
su normaluser -c 'brew test hello'
