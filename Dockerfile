FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /app

COPY . .

RUN bundle install

EXPOSE 3000

CMD ["bash"]