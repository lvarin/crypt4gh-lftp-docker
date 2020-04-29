FROM python:3-alpine

RUN apk add gcc libressl-dev musl-dev libffi-dev make lftp

RUN pip3 install crypt4gh

CMD ["crypt4gh"]

