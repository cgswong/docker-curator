# Elasticsearch Curator in docker

[![Circle CI](https://circleci.com/gh/cgswong/docker-curator/tree/master.svg?style=svg)](https://circleci.com/gh/cgswong/docker-curator/tree/master)

This is a Dockerized version of [Elasticsearch Curator](https://github.com/elastic/curator), which is a tool to manage Elasticsearch indices.

## Why this image

This image uses the latest Curator release and is based on the minimal `alpine` image.

## Usage

Image `ENTRYPOINT` is set to the curator script, so just run the image:

```sh
docker run --rm cgswong/curator:latest --help
```
