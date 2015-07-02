# ################################################################
# DESC: Docker file to run Elasticsearch Curator.
# ################################################################
FROM alpine:latest
MAINTAINER Stuart Wong <cgs.wong@gmail.com>

ENV CURATOR_VERSION %%VERSION%%

RUN apk --update add \
      python \
      py-pip &&\
    pip install --upgrade pip &&\
    pip install elasticsearch-curator==${CURATOR_VERSION}

ENTRYPOINT ["/usr/bin/curator"]
CMD [""]
