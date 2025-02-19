FROM python:3.8

RUN apt-get update && \
      apt-get install -yq \
              python-dev-is-python3 \
              python3-pip