FROM python:3

RUN apt update && apt install libnss-wrapper lftp openssh-client && \
    pip3 install crypt4gh

COPY crypt4gh-wrap* /usr/local/bin/

CMD ["crypt4gh"]

