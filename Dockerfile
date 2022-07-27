FROM logstash:8.3.2

#grafana/logstash-output-loki:2.5.0-amd64

USER root

RUN apt-get --assume-yes install rubygems ruby-dev
RUN gem install dalli

RUN logstash-plugin install logstash-output-loki
RUN logstash-plugin install logstash-output-google_pubsub
#RUN logstash-plugin install logstash-input-google_pubsub # Not work - cause error runtime

USER logstash

RUN echo $(date) > /tmp/date.txt
