# Dockerfile
FROM seapy/rails-nginx-unicorn-pro:v1.0-ruby2.1.2-nginx1.6.0
MAINTAINER seapy(iamseapy@gmail.com)

ENV DB_CONNECT_USERNAME postgres
ENV DB_CONNECT_PASSWORD postgres
ENV DB_CONNECT_HOST localhost
ENV DB_CONNECT_PORT 5432
ENV SECRET_KEY_BASE cfe80ba638a6abd4aa6a1765bc4933319c2c2b6435a2b4ee914db72a5e9a87c60b07526788c2ac4ea8b6938ddbb83aa54da101d21f5514a4cff2adeeae96407b

#(required) Install Rails App
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app

#(required) nginx port number
EXPOSE 80
