#!/bin/bash
###########

HERE=$PWD

echo "Please enter your user password, when prompted."

echo "Installing system packages as root"

sudo apt-get install build-essential libsqlite3-dev libssl-dev zlib1g-dev libreadline-dev libyaml-dev git

echo "Installing everything else as current user."

# Install rbenv for managing enabling of multiple rubies.
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

# Install the ruby-build plugin for easy building of rubies.
mkdir -p ~/.rbenv/plugins
cd !$
git clone git://github.com/sstephenson/ruby-build.git
cd $HERE/..

rbenv install 2.4.0
rbenv global 2.4.0

gem install bundler

bundle install

rake db:setup

echo "You can now start the server using 'rails s'"

