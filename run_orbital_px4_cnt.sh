
# enable access to xhost from the container
xhost +


# Run docker and open bash shell 
docker run -it --rm --privileged \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v "/dev:/dev" \
--mount type=bind,source=$(pwd)/PX4_orbital,target=/root/PX4_orbital \
--mount type=bind,source=$(pwd)/ros2_ws,target=/root/ros2_ws/src/pkg \
--env="DISPLAY=$DISPLAY" \
--network host \
--name=px4-orbital-$1 px4-orbit-ros2-humble-gz bash 




