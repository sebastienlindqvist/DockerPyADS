# Extend the ROS2 distro
FROM osrf/ros:humble-desktop-full

# Install the required packages
RUN apt-get update && \
apt-get install -y

RUN apt-get install python3 && \
apt-get install python3-pip -y && \
pip3 install pyads && \
pip3 install PyYAML && \
pip3 install termcolor

RUN sudo apt install ros-humble-turtlesim
RUN sudo apt install ros-humble-rqt
RUN sudo apt install python3-rosdep

#RUN pip3 install pyads

RUN apt install python3-colcon-common-extensions
RUN apt install python3-colcon-mixin
#RUN colcon mixin add default https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml
RUN colcon mixin update default
RUN apt install python3-vcstool

RUN mkdir -p ~/ros2_ws/src
RUN cd ~/ros2_ws/src && \
git clone https://github.com/ros2/examples -b humble && \
git clone https://github.com/Dobot-Arm/DOBOT_6Axis_ROS2_V4.git && \
git clone https://github.com/sebastienlindqvist/py_srvcli.git

RUN mkdir -p ~/ws_moveit2/src
RUN cd ~/ws_moveit2/src && \
git clone --branch humble https://github.com/ros-planning/moveit2_tutorials &&\
vcs import < moveit2_tutorials/moveit2_tutorials.repos

#RUN sudo apt update && rosdep install -r --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y


RUN cd ~/ros2_ws && \
. /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build --symlink-install

#RUN cd ~/ws_moveit2 &&\
#colcon build --mixin release 

RUN echo "export DOBOT_TYPE=cr3" >> ~/.bashrc
RUN echo "export IP_address=192.168.5.1" >> ~/.bashrc
#CMD source /root/.bashrc

# Set the environment variable required to run TurtleBot3
#ENV TURTLEBOT3_MODEL=burger