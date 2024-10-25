
FROM ubuntu:latest

RUN apt-get install -y python3 python3-pip && \
    pip3 install flask

WORKDIR /opt/app

COPY application.py /opt/app    

CMD ["python3", "/opt/app/application.py"]
