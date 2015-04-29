# Dockerfile
FROM seapy/rails-nginx-unicorn-pro:v1.0-ruby2.1.2-nginx1.6.0
MAINTAINER seapy(iamseapy@gmail.com)

# Add here your preinstall lib(e.g. imagemagick, mysql lib, pg lib, ssh config)

#(required) Install Rails App
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --without development test
ADD . /app

#(required) nginx port number
EXPOSE 80
