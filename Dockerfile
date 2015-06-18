# ################################################################
# DESC: Docker file to run Elasticsearch Curator.
# ################################################################
FROM alpine:latest
MAINTAINER Stuart Wong <cgs.wong@gmail.com>

RUN apk --update add \
      python \
      py-pip &&\
    pip install --upgrade pip &&\
    pip install elasticsearch-curator

ENTRYPOINT ["/usr/bin/curator"]
CMD [""]

