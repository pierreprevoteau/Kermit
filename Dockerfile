# Dockerfile
FROM peterthecoon/rails-prod:latest
MAINTAINER Pierre Prevoteau <pierre.prevoteau@askida.fr>

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --force-yes libpq-dev

ENV DB_CONNECT_USERNAME postgres
ENV DB_CONNECT_PASSWORD postgres
ENV DB_CONNECT_HOST localhost
ENV DB_CONNECT_PORT 5432
ENV RAILS_RESQUE_REDIS localhost:6712
ENV RESQUE_WEB_HTTP_BASIC_AUTH_USER kermit
ENV RESQUE_WEB_HTTP_BASIC_AUTH_PASSWORD kermit

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app

EXPOSE 80

CMD ["/app/bin/resque", "resque", "work", "--queues=*"]
