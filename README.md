
# PX4-orbit_utils

## Description
This repository contains the files and scripts required to run the PX4 orbital stabilization simulation in a Docker container. The simulation uses ROS2 Foxy/Humble and PX4 v1.13/v1.14 firmware versions.


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

1. Clone the custom PX4 repository in the **PX4-orbit_utils** directory. 
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


## Instructions to use PX4_orbital

1. Clone the custom PX4 repository in the **PX4-orbit_utils** directory:
   
   ```sh 
   git clone --recursive --single-branch -b devel https://github.com/fp018/PX4_orbital.git 
   ```
2. Build the Docker image:
   ```sh
   docker build -f ./Dockerfile/dockerfile-humble-gz -t px4-orbit-ros2-humble-gz .
   ```
3. Run the Docker container:
   ```sh
   ./run_orbital_px4_cnt.sh 
   ```
4. Start the PX4 SITL simulation:
   ```sh
   cd PX4_orbital 
   make px4_sitl gz_x500
   ```

### PX4 Documentation
- **PX4 Official Documentation**: [PX4 Documentation](https://docs.px4.io/main/en/)

### QGroundControl
- **Getting Started with QGroundControl**: [QGroundControl Download and Install](https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html)

### Orbit Mode for Multicopters
- **How to Start an Orbit**: [Orbit Multicopter](https://docs.px4.io/main/en/flight_modes_mc/orbit.html#orbit-multicopter)

### Custom Firmware Paper
- **ICUAS Paper on IEEE Xplore**: [ICUAS Paper](https://ieeexplore.ieee.org/document/10556938/)

### Useful PX4 Simulation Terminal Commands
- **Takeoff Command**: `commander takeoff`
- **Land Command**: `commander land`
- **List All Topics**: `uorb top`
- **Listen to a Specific Topic**: `listener <name_topic>`

### PX4 with ROS2
1. **Start Micro XRCE Agent**:
   ```sh
   MicroXRCEAgent udp4 -p 8888
   ```
2. **Listen to PX4 Topics in ROS2**:
   ```sh
   ros2 topic echo <topic_name>
   ```

These resources and commands should help you get started with PX4, QGroundControl, and integrating PX4 with ROS2 for UAV development and simulations.
