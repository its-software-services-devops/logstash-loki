FROM grafana/logstash-output-loki:2.5.0-amd64

RUN gem install dalli -v 3.2.0

RUN echo $(date) > /tmp/date.txt
