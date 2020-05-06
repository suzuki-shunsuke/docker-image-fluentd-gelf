FROM fluent/fluentd:v1.3.2-debian
ADD https://raw.githubusercontent.com/emsearcy/fluent-plugin-gelf/master/lib/fluent/plugin/out_gelf.rb /fluentd/plugins/
RUN cd /fluentd/plugins && \
    gem install gelf && \
    gem sources --clear-all && \
    rm -rf /var/lib/apt/lists/*
