#!/bin/sh

sudo apt-get update

# essential
sudo apt-get install git cmake cmake-curses-gui build-essential gitg git-gui meld vim terminator mercurial libmatio-dev doxygen

# ROS list and key
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Gazebo list and key
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

sudo apt-get update

if [ "`lsb_release -cs`" = 'xenial' ]; then
        sudo apt-get install ros-kinetic-desktop-full
	sudo apt-get install ros-kinetic-eigen-conversions ros-kinetic-kdl-parser ros-kinetic-effort-controllers ros-kinetic-controller-manager ros-kinetic-transmission-interface
        sudo apt-get install ros-kinetic-gazebo-ros-pkgs
	sudo apt-get install ros-kinetic-combined-robot-hw
        sudo apt-get install ros-joint-state-controller ros-kinetic-velocity-controllers ros-kinetic-twist-mux ros-kinetic-diff-drive-controller ros-kinetic-costmap-prohibition-layer ros-kinetic-moveit ros-kinetic-moveit-core ros-kinetic-teb-local-planner ros-kinetic-move-base ros-kinetic-moveit-kinematics ros-kinetic-robot-localization ros-kinetic-combined-robot-hw ros-kinetic-joint-limits-interface ros-kinetic-gmapping ros-kinetic-amcl ros-kinetic-position-controllers ros-kinetic-joint-trajectory-controller ros-kinetic-moveit-visual-tools ros-kinetic-moveit-ros-planning-interface ros-kinetic-ros-control ros-kinetic-ros-controllers ros-kinetic-global-planner ros-kinetic-joint-state-publisher-gui ros-kinetic-gazebo-ros-control
fi

if [ "`lsb_release -cs`" = 'bionic' ]; then
        sudo apt-get install ros-melodic-desktop-full
	 sudo apt-get install ros-melodic-eigen-conversions ros-melodic-kdl-parser ros-melodic-effort-controllers ros-melodic-controller-manager ros-melodic-transmission-interface
        sudo apt-get install ros-melodic-gazebo-ros-pkgs
	sudo apt-get install ros-melodic-combined-robot-hw
        sudo apt-get install ros-joint-state-controller ros-melodic-velocity-controllers ros-melodic-twist-mux ros-melodic-diff-drive-controller ros-melodic-costmap-prohibition-layer ros-melodic-moveit ros-melodic-moveit-core ros-melodic-teb-local-planner ros-melodic-move-base ros-melodic-moveit-kinematics ros-melodic-robot-localization ros-melodic-combined-robot-hw ros-melodic-joint-limits-interface ros-melodic-gmapping ros-melodic-amcl ros-melodic-position-controllers ros-melodic-joint-trajectory-controller ros-melodic-moveit-visual-tools ros-melodic-moveit-ros-planning-interface ros-melodic-ros-control ros-melodic-ros-controllers ros-melodic-global-planner ros-melodic-joint-state-publisher-gui ros-melodic-gazebo-ros-control

fi

# ROS config
sudo apt-get -y --allow-unauthenticated install python-pip
sudo apt-get -y --allow-unauthenticated install python-rosdep
sudo rosdep init
rosdep update
