# docker-elasticsearch-kubernetes-search-guard
adding search guard to docker-elasticsearch-kubernetes image

# instruction

1. Generate certificates and keys:

```shell
./search-guard-tlstool-1.5/tools/sgtlstool.sh -c ./config/tlsconfig.yml -ca -crt
```

2. copy configuration `out/node_elasticsearch_config_snippet.yml` into `config/elasticsearch.yml`

3. build docker image:

```shell
docker build -t docker-es-k8s-search-guard:latest .
docker run docker run -p 9200:9200 docker-es-k8s-search-guard:latest
```

This starts up a single instance with search guard installed.

4. While Elasticsearch is starting up, the Search Guard configuration is not initialized. Open interactive shell of container and run the following command inside the container (the below sets up with demo credentials, please override with your own search-guard configuration into the container directory `/elasticsearch/plugins/search-guar-6/sgconfig` before running it):

```shell
plugins/search-guard-6/tools/sgadmin.sh -h 0.0.0.0 -cd plugins/search-guard-6/sgconfig -icl -key config/pipeline.key -cert config/pipeline.pem -cacert config/root-ca.pem -nhnv
```

# reference

- https://github.com/pires/docker-elasticsearch-kubernetes
- https://docs.search-guard.com/latest/demo-installer