# Check if the input argument is provided
if [ -z "$1" ]; then
  echo "Error: No ROS2 distribution specified. Please provide 'foxy' or 'humble' or 'humble-gz'."
  exit 1
fi

# Check if the input is either 'foxy' or 'humble' or 'humble-gz'
if [ "$1" != "foxy" ] && [ "$1" != "humble" ] && [ "$1" != "humble-gz" ]; then
  echo "Error: Invalid ROS2 distribution specified. Please provide 'foxy' or 'humble' or 'humble-gz'."
  exit 1
fi

echo "ROS2: $1"

# enable access to xhost from the container
xhost +


# Run docker and open bash shell 
docker run -it --rm --privileged \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v "/dev:/dev" \
--mount type=bind,source=$(pwd)/Px4_Tilting_Custom_Control,target=/root/Px4_Tilting_Custom_Control \
--mount type=bind,source=$(pwd)/ros2_ws,target=/root/ros2_ws/src/pkg \
--env="DISPLAY=$DISPLAY" \
--network host \
--name=px4-custom-$1 px4-custom-ros2-$1 bash 




