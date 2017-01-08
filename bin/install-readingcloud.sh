#!/bin/bash
HERE=$PWD
# Install the ruby-build plugin for easy building of rubies.
mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git
cd $HERE

rbenv install 2.4.0
rbenv global 2.4.0

gem install bundler

bundle install

rake db:setup

echo "You can now start the server using 'rails s'"

