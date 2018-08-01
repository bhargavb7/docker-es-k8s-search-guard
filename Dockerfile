FROM quay.io/pires/docker-elasticsearch-kubernetes:6.3.1

MAINTAINER simon@divby0.io

ENV ES_TMPDIR="/tmp"
ENV NODE_NAME="test"

ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml
ADD install_search_guard.exp /install_search_guard.exp

RUN apk add --update expect
RUN chmod +x /install_search_guard.exp

WORKDIR /elasticsearch

RUN bin/elasticsearch-plugin install -b com.floragunn:search-guard-6:6.3.1-22.3

# make the script run in alpine
RUN grep -rl quiet plugins/search-guard-6/tools/install_demo_configuration.sh | xargs sed -i 's/--quiet/-q/g'
RUN chmod +x plugins/search-guard-6/tools/install_demo_configuration.sh

RUN /install_search_guard.exp
