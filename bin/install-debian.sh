#!/bin/bash
###########

HERE=$PWD

echo "Please enter your user password, when prompted."

echo "Installing system packages as root"

sudo apt-get install build-essential libsqlite3-dev libssl-dev zlib1g-dev libreadline-dev libyaml-dev nodejs git

echo "Installing everything else as current user."

# Install rbenv for managing enabling of multiple rubies.
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

echo "Now, please run bin/install_readingcloud.sh to finish the installation process."

exec $SHELL

