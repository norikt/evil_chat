FROM ruby:2.5.0-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl \
    && mkdir /myapp \
    # nodejs & yarn
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y nodejs yarn

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install -j4 \
    && yarn install \
    && bundle exec rails webpacker:compile
COPY . /myapp

CMD ["rails", "server", "-b", "0.0.0.0"]
