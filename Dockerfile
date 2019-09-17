FROM ruby:2.5.3-alpine3.9

ENV APP_DIR /app

WORKDIR $APP_DIR

RUN addgroup -S app && \
    adduser -S -g app -h $APP_DIR app && \
    mkdir -p $APP_DIR && \
    chown app:app $APP_DIR $UTILS_DIR

RUN apk --update --no-cache add git curl build-base tzdata nodejs && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

USER app:app

COPY --chown=app:app . .

RUN echo 'gem: --no-document' > ~/.gemrc && \
    gem install bundler && \
    bundle install --path vendor/bundle --jobs=4 --no-cache --clean

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle","exec","rails","s","-p","3000","-b","0.0.0.0"]

