# ################################################################
# NAME: Dockerfile
# DESC: Docker file to run Elasticsearch Curator.
#
# LOG:
# yyyy/mm/dd [name] [version]: [notes]
# 2015/04/13 cgwong [v0.1.0]: Initial creation.
# ################################################################
FROM gliderlabs/alpine:3.1

RUN apk --update add python py-pip && \
    pip install elasticsearch-curator

ENTRYPOINT ["/usr/bin/curator"]
CMD [""]