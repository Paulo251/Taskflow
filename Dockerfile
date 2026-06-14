
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

ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID appgroup && \
  useradd -u $UID -g appgroup -m appuser

USER appuser
