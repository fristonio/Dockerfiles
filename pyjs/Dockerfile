FROM node:8-alpine

MAINTAINER Deepesh Pathak <deepshpathak@gmail.com>

ENV PATH /usr/local/bin:$PATH

RUN apk update
RUN apk add --no-cache python && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip && \
    rm -r /root/.cache

CMD ["python"]
