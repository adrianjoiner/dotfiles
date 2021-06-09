#!/usr/bin/env bash
echo "Installing base gnu utility packages"
brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names
brew install gnu-grep --with-default-names
brew install findutils

echo "Installing packages..."
# Install Bash 4 (osx version always ood)
brew install bash
brew install ack
brew install autoconf
brew install automake
brew install awscli
brew install bash-completion
brew install docker-compose
brew install gdbm
brew install geoip
brew install gettext
brew install git
brew install git-lfs
brew install htop
brew install kubernetes-cli
brew install icu4c
brew install libdvdcss
brew install libidn2
brew install libunistring
brew install links
brew install nmap
brew install node
brew install node-build
brew install nodenv
brew install openssl
brew install openssl@1.1
brew install packer
brew install pcre
brew install pkg-config
brew install python
brew install python3 
brew install python3.9
brew install qt
brew install readline
brew install rename
brew install sphinx-doc
brew install ssh-copy-id
brew install tmux
brew install tree
brew install unrar
brew install watch
brew install watchman
brew install wget
brew install z

echo "Finished installing packages."