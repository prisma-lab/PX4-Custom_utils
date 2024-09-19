
# PX4-Custom_utils

## Description
This repository contains all the files and scripts necessary to run the Custom PX4 Gazebo simulation in a Docker container. Two different Dockerfiles are provided to run both the **ROS2 Foxy-PX4 v1.13** and the **ROS2 Humble-PX4 v1.14** firmware versions.


## Prerequisite: Docker

If you do not have Docker installed, you can install it by following the instructions: 
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
1. Clone the **PX4-Custom_utils**
   ```sh
   git clone https://github.com/prisma-lab/PX4-Custom_utils && cd PX4-Custom_utils
   ```
2. In the Clone PX4-Custom_utils folder, clone the custom PX4 . 
   For the ROS2 **Foxy** version:
   ```sh
   git clone --single-branch -b prisma https://github.com/fp018/PX4-orbit.git --recursive
   ```
   For the ROS2 **Humble** version:
   ```sh
   git clone --single-branch -b v.1.14 https://github.com/fp018/PX4-orbit.git --recursive
   ``` 
   
2. Build the Docker image:
   ```sh
   docker build -f ./Dockerfile/dockerfile-${ROS2_VERSION} -t px4-orbit-ros2-${ROS2_VERSION} .
   ```
   
## Running the Simulation
1. Run the Docker container:
   ```sh
   ./run_custom_px4_cnt.sh ${ROS2_VERSION}
   ```
2. Start the PX4 SITL simulation:
   ```sh
   cd PX4-orbit 
   make px4_sitl gazebo
   ```
3. Start the custom QGroundControl station:
   ```sh
   ./QGroundControl.AppImage
   ```

## Adding ROS2 Packages

The container shares the `ros2_ws` directory with the host machine. You can add additional ROS2 packages to the `ros2_ws` directory to be build in the container workspace.


### PX4 Documentation
- **PX4 Official Documentation**: [PX4 Documentation](https://docs.px4.io/main/en/)

### QGroundControl
- **Getting Started with QGroundControl**: [QGroundControl Download and Install](https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html)

### Custom Firmware Paper
- **ICUAS Paper on IEEE Xplore**: [ICUAS Paper](https://ieeexplore.ieee.org/document/10556938/)



