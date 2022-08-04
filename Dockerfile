FROM bitnami/logstash:8.3.3

#logstash:8.3.2

USER root

RUN logstash-plugin remove x-pack
RUN logstash-plugin install logstash-input-google_pubsub # Not work, runtime error

#RUN apt-get --assume-yes install rubygems ruby-dev
#RUN gem install dalli

RUN logstash-plugin install logstash-output-loki
RUN logstash-plugin install logstash-output-google_pubsub

USER logstash

RUN echo $(date) > /tmp/date.txt
