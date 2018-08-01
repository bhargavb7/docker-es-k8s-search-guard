# docker-elasticsearch-kubernetes-search-guard
adding search guard to docker-elasticsearch-kubernetes image

# instruction

```shell
docker build -t docker-es-k8s-search-guard:latest .
docker run docker run -p 9200:9200 docker-es-k8s-search-guard:latest
```

This starts up a single instance with search guard demo installed and initialized.

# reference

- https://github.com/pires/docker-elasticsearch-kubernetes
- https://docs.search-guard.com/latest/demo-installer