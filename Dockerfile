FROM ruby:2.6.5-slim
LABEL maintainer="cheimke@loumaris.com"

WORKDIR /app

EXPOSE 3000

# Set the locale
RUN apt-get update && \
    apt-get install -y locales

ENV locale-gen C.UTF-8 && \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8

RUN echo "set input-meta on" >> /etc/inputrc && \
    echo "set output-meta on" >> /etc/inputrc && \
    echo "set convert-meta off" >> /etc/inputrc && \
    echo "export LANG=de_DE.utf8" >> /etc/profile && \
    cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# install bundler
RUN gem install bundler

# install some tools
RUN apt install -y build-essential libpq-dev nodejs xvfb libfontconfig wkhtmltopdf

# clean up
RUN  apt-get autoremove -y
