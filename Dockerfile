
FROM ubuntu:latest


WORKDIR /opt/app


RUN apt-get install -y python3 python3-pip && \
    pip3 install flask


COPY application.py /opt/app    

CMD ["python3", "/opt/app/application.py"]
