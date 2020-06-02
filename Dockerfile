FROM python:3

RUN apt update && apt install -y libnss-wrapper lftp openssh-client && \
    pip3 install crypt4gh

COPY bin/* /usr/local/bin/

CMD ["crypt4gh"]

