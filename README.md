
# PX4-orbit_utils

## Description
This repository contains the files and scripts required to run the PX4 orbital stabilization simulation in a Docker container. The simulation uses ROS2 Foxy and PX4 v1.13.0 firmware versions.


## Prerequisites
Ensure you have the following installed on your system:
- Docker

If you do not have Docker installed, you can install it by following the instructions [here](https://docs.docker.com/get-docker/).
```sh
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```
``` sh
# Create docker group (may not be required)
sudo groupadd docker
# Add your user to the docker group.
sudo usermod -aG docker $USER
# Log in/out again before using docker!
```

## Installation


1. Update PX4 submodules:
   ```sh
   cd PX4-orbit && git submodule update --init --recursive
   git tag v1.13.0-dev
   ```

2. Build the Docker image:
   ```sh
   docker build -t px4-orbit-ros2-foxy .
   ```

## Running the Simulation
1. Run the Docker container:
   ```sh
   ./run_px4_cnt.sh
   ```
2. Start the PX4 SITL simulation:
   ```sh
   cd PX4-orbit \
   make px4_sitl gazebo
   ```
## Adding ROS2 Packages
The container shares the `ros2_ws` directory with the host machine. You can add additional ROS2 packages to the `ros2_ws` directory.

