FROM fluent/fluentd:v1.2.5-debian
ADD https://raw.githubusercontent.com/emsearcy/fluent-plugin-gelf/master/lib/fluent/plugin/out_gelf.rb /fluentd/plugins/
RUN buildDeps="" && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends $buildDeps && \
    cd /fluentd/plugins && \
    gem install gelf && \
    apt-get purge -y --auto-remove \
        -o APT::AutoRemove::RecommendsImportant=false \
        $buildDeps && \
    gem sources --clear-all && \
    rm -rf /var/lib/apt/lists/*
