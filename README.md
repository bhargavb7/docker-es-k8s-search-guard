# docker-elasticsearch-kubernetes-search-guard
adding search guard to docker-elasticsearch-kubernetes image

# instruction

1. Generate certificates and keys:

```shell
./search-guard-tlstool-1.5/tools/sgtlstool.sh -c ./config/tlsconfig.yml -ca -crt
```

2. copy `out/node_elasticsearch_config_snippet.yml` into `config/elasticsearch.yml`

3. build docker image:

```shell
docker build -t docker-es-k8s-search-guard:latest .
docker run docker run -p 9200:9200 docker-es-k8s-search-guard:latest
```

This starts up a single instance with search guard demo installed and initialized.

# reference

- https://github.com/pires/docker-elasticsearch-kubernetes
- https://docs.search-guard.com/latest/demo-installer