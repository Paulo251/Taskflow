
FROM ruby:3.3

RUN apt-get update -qq && apt-get install -y \
  build-essential libpq-dev nodejs npm curl git && \
  npm install -g yarn && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /rails

ENV BUNDLE_PATH=/rails/vendor/bundle

COPY Gemfile ./


COPY . .

EXPOSE 3000
