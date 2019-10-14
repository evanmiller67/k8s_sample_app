FROM ruby:2.6-alpine3.8

WORKDIR /app

ADD config.yml /app
ADD Gemfile /app
ADD Gemfile.lock /app
RUN gem install bundler
RUN bundle install
ADD application.rb /app
ADD views /app/views

EXPOSE 4567

CMD [ "ruby", "/app/application.rb" ]
