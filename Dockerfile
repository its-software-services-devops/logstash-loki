FROM logstash:8.3.2

#grafana/logstash-output-loki:2.5.0-amd64

RUN apt-get install rubygems ruby-dev
RUN logstash-plugin install logstash-output-loki
RUN logstash-plugin install logstash-output-google_pubsub

RUN gem install dalli

RUN echo $(date) > /tmp/date.txt
