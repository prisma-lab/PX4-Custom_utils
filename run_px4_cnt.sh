
# docker exec -itu 0 px4-ros2 bash  // run root

# enable access to xhost from the container
xhost +


# Run docker and open bash shell 
docker run -it --rm --privileged \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v "/dev:/dev" \
--mount type=bind,source=$(pwd)/../PX4-orbit,target=/root/PX4-orbit \
--mount type=bind,source=$(pwd)/ros2_ws,target=/root/ros2_ws/src/pkg \
--env="DISPLAY=$DISPLAY" \
--network host \
--name=px4-orbital-foxy px4-orbit-ros2-foxy bash 




