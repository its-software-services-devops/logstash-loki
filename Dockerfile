FROM logstash:8.3.2

USER root

RUN apt-get update
RUN apt-get --assume-yes install rubygems ruby-dev libpq-dev

RUN gem install dalli
RUN gem install pg -- --with-pg-lib=/usr/lib

RUN logstash-plugin install logstash-output-loki
RUN logstash-plugin install logstash-output-google_pubsub
RUN logstash-plugin install logstash-input-google_pubsub # Not work, runtime error

USER logstash

RUN echo $(date) > /tmp/date.txt
