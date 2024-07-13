
# docker exec -itu 0 px4-ros2 bash  // run root

# enable access to xhost from the container
xhost +


# Run docker and open bash shell 
docker run -it --rm --privileged \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v "/dev:/dev" \
-v $(pwd)/PX4-orbit:/root/PX4-orbit:rw \
-v $(pwd)/ros2_ws:/root/ros2_ws/src/pkg:rw \
--env="DISPLAY=$DISPLAY" \
--network host \
--name=px4-orbital-foxy px4-orbit-ros2-foxy bash 




