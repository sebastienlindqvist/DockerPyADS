FROM osrf/ros:humble-desktop-full

#COPY . /app

RUN apt-get update
RUN apt-get install -y apt-transport-https \
        python3

RUN apt-get install -y python3-pip
#RUN apt-get install -y pipx


#RUN pipx install numpy

#RUN pip --version  
#just for test