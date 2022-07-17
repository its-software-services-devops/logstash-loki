FROM grafana/logstash-output-loki:2.5.0-amd64

RUN gem install memcache-client

RUN echo $(date) > /tmp/date.txt
