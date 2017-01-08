#!/bin/bash
###########

HERE=$PWD

echo "Please enter your user password, when prompted."

echo "Installing system packages as root"

sudo yum -y groupinstall "Development"
sudo yum -y install epel-release sqlite-devel openssl-devel zlib-devel readline-devel libyaml-devel nodejs git

echo "Installing everything else as current user."

# Install rbenv for managing enabling of multiple rubies.
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

echo "Now, please run bin/install_readingcloud.sh to finish the installation process."

exec $SHELL
