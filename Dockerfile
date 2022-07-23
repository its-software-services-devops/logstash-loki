FROM grafana/logstash-output-loki:2.5.0-amd64

RUN gem install dalli -v 3.2.0

#RUN sed -i 's/clamp (1.0.1)/clamp (1.3.2)/g' /usr/share/logstash/Gemfile.lock
#RUN sed -i 's/ffi (1.15.4-java)/ffi (1.15.5-java)/g' /usr/share/logstash/Gemfile.lock
#RUN sed -i 's/jruby-openssl (0.11.0-java)/jruby-openssl (0.14.0-java)/g' /usr/share/logstash/Gemfile.lock
#RUN bundle update

RUN logstash-plugin update logstash-output-google_pubsub

RUN echo $(date) > /tmp/date.txt
