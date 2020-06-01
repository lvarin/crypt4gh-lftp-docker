FROM python:3-alpine

RUN apk add gcc libressl-dev musl-dev libffi-dev make lftp openssh && \
    pip3 install crypt4gh

COPY crypt4gh-wrap* /usr/local/bin/

CMD ["crypt4gh"]

