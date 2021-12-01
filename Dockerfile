# 'ARG': we set these args in docker-compose.yml
ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

#ARG PG_MAJOR  # unused
ARG NODE_MAJOR
ARG BUNDLER_VERSION
ARG YARN_VERSION

# add node source
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# add yarn source
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

# install app dependencies
RUN apt-get update -qq && apt-get -yq dist-upgrade && apt-get install -yq libpq-dev postgresql-client nodejs yarn && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && truncate -s 0 /var/log/*log

# configure bundler
ENV LANG=C.UTF-8 BUNDLE_JOBS=4 BUNDLE_RETRY=3

# install ruby deps
RUN gem update --system && gem install bundler:$BUNDLER_VERSION

RUN mkdir -p /app
WORKDIR /app
