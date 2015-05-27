# ################################################################
# DESC: Docker file to run Elasticsearch Curator.
# ################################################################
FROM gliderlabs/alpine:3.1

RUN apk --update add python py-pip && \
    pip install elasticsearch-curator

ENTRYPOINT ["/usr/bin/curator"]
CMD [""]

