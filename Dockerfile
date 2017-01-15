FROM ruby:2.4.0
MAINTAINER Thomas Cherryhomes <thom.cherryhomes@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 3000

RUN apt-get update -qq
RUN apt-get install -y build-essential libsqlite3-dev libssl-dev zlib1g-dev libreadline-dev libyaml-dev nodejs git

RUN gem install bundler
VOLUME /app
ADD . /app
WORKDIR /app

RUN bundle install
RUN rake db:setup
RUN rake db:migrate
ENTRYPOINT exec /app/docker-start.sh
