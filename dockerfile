FROM ubuntu:latest

WORKDIR /app
#COPY . /app
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y python3-full
RUN apt-get install -y python3-pip
RUN apt-get install -y pipx


RUN pipx install numpy

RUN pip --version  
#just for test