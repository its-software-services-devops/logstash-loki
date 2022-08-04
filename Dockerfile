FROM docker.elastic.co/logstash/logstash:5.6.5

# Below ENV is a fix from stackovertflow.
# See https://stackoverflow.com/questions/46974598/logstash-with-google-pubsub-input-plugin-error-certificate-verify-failed
ENV SSL_CERT_FILE /opt/logstash/logstash-core/lib/logstash/certs/cacert.pem

RUN logstash-plugin remove x-pack
RUN logstash-plugin install logstash-input-google_pubsub
RUN logstash-plugin install logstash-output-loki
RUN logstash-plugin install logstash-output-google_pubsub

#FROM bitnami/logstash:8.3.3

#logstash:8.3.2

#USER root

#RUN logstash-plugin remove x-pack
#RUN logstash-plugin install logstash-input-google_pubsub # Not work, runtime error

#RUN apt-get --assume-yes install rubygems ruby-dev
#RUN gem install dalli

#RUN logstash-plugin install logstash-output-loki
#RUN logstash-plugin install logstash-output-google_pubsub

#USER logstash

RUN echo $(date) > /tmp/date.txt
