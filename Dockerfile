# https://hub.docker.com/_/elixir/
# https://github.com/rbeene/phoenix-with-docker/blob/master/Dockerfile
FROM elixir:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

# Install the Phoenix framework itself
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# https://github.com/colindensem/demo-docker-elixir-phoenix/blob/master/Dockerfile
RUN apt-get update \
    && apt-get install -y curl inotify-tools \
    && curl -sL https://deb.nodesource.com/setup_0.12 | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install NodeJS 6.x and the NPM
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y -q nodejs \
    && apt-get install -y curl inotify-tools

WORKDIR /app
ADD . /app

