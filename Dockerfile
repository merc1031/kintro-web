ARG PYTHON_VERSION
ARG PYTHON_BASE
ARG PYTHON_IMAGE=python:${PYTHON_VERSION}-${PYTHON_BASE}
FROM ${PYTHON_IMAGE}

ENV PYTHON_VERSION=${PYTHON_VERSION}

ARG KINTRO_WEB_REPO=https://github.com/merc1031/kintro-web.git
ARG KINTRO_WEB_BRANCH=main

# SLOWISH
RUN apk add gcc \
            python3-dev \
            musl-dev \
            linux-headers \
            g++ \
	    git \
	    jq \
	    bash

RUN git clone ${KINTRO_WEB_REPO} kintro-web \
      && cd kintro-web \
      && git checkout ${KINTRO_WEB_BRANCH} \
      && pip install -e . \
      && pip install uwsgi

VOLUME ["/data"]
WORKDIR kintro-web
EXPOSE 8080

ENTRYPOINT ["uwsgi", "uwsgi_conf.ini"]
