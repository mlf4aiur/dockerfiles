FROM python:3-alpine

MAINTAINER Kevin Li <defeng.li@zuora.com>

RUN mkdir -p /myapp
WORKDIR /myapp

RUN pip install Flask==0.10.1

COPY hello.py /myapp/hello.py

VOLUME ["/myapp"]

CMD ["python", "./hello.py"]
