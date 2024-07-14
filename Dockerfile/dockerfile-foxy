# PX4-Orbital Dockerfile

FROM px4io/px4-dev-ros2-foxy:latest


WORKDIR /root

# # ROS2 workspace


RUN apt update && apt-get install -y --no-install-recommends \   
    ros-foxy-mavros ros-foxy-mavros-extras  \
    libcanberra-gtk-module libcanberra-gtk3-module \
    ros-foxy-rmw-fastrtps-cpp 

RUN mkdir -p /root/ros2_ws/src \
    && cd /root/ros2_ws/src \
    && git clone --single-branch -b release/1.13 https://github.com/prisma-lab/px4_msgs.git \
    && cd .. \
    && . /opt/ros/foxy/setup.sh \
    && colcon build 

RUN git clone --recursive https://github.com/eProsima/Fast-DDS-Gen.git -b v1.0.4 ~/Fast-RTPS-Gen \
    && cd ~/Fast-RTPS-Gen \
    && ./gradlew assemble \
    && sudo ./gradlew install

# Additional packages
RUN apt update && apt install -y --no-install-recommends \    
    tmux \
    tmuxp \
    nano \
    gedit

#COPY tmux.conf .tmux.conf

RUN cd /root/ros2_ws/src \ 
    && . /root/ros2_ws/install/setup.sh \
    && git clone --single-branch -b release/1.13 https://github.com/prisma-lab/px4_ros_com.git 

# # PX4-Autopilot to fix git submodule update

RUN  git config --global --add safe.directory '*'


