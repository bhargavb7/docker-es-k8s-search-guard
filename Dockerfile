FROM quay.io/pires/docker-elasticsearch-kubernetes:6.3.1

MAINTAINER simon@divby0.io

ENV ES_TMPDIR="/tmp"
ENV NODE_NAME="test"

RUN apk add --update expect

WORKDIR /elasticsearch

RUN bin/elasticsearch-plugin install -b com.floragunn:search-guard-6:6.3.1-22.3

ADD search-guard-tlstool-1.5 /search-guard-tlstool

################## demo configuration #####################

# ADD install_search_guard.exp /install_search_guard.exp
# RUN chmod +x /install_search_guard.exp

# # make the grep script run in alpine
# RUN grep -rl quiet plugins/search-guard-6/tools/install_demo_configuration.sh | xargs sed -i 's/--quiet/-q/g'
# RUN chmod +x plugins/search-guard-6/tools/install_demo_configuration.sh

# RUN /install_search_guard.exp

###########################################################

ADD out/* config/
ADD config/elasticsearch.yml config/elasticsearch.yml

RUN chmod +x plugins/search-guard-6/tools/sgadmin.sh
