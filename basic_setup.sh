#!/bin/sh

# Configure your Ubuntu repositories to allow “restricted”, “universe”, and “multiverse”
sudo add-apt-repository restricted 
sudo add-apt-repository universe 
sudo add-apt-repository multiverse

# Update
sudo apt-get update

# essential
sudo apt-get install git cmake cmake-curses-gui build-essential gitg git-gui meld vim terminator mercurial libmatio-dev doxygen kazam kdevelop net-tools

# ROS list and key
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Gazebo list and key
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

sudo apt update

# Ubuntu 16.04LTS
if [ "`lsb_release -cs`" = 'xenial' ]; then
        sudo apt-get install ros-kinetic-desktop-full
	sudo apt-get install ros-kinetic-eigen-conversions ros-kinetic-kdl-parser ros-kinetic-effort-controllers ros-kinetic-transmission-interface
        sudo apt-get install ros-kinetic-gazebo-ros-*
        sudo apt-get install ros-kinetic-joint-state*
	sudo apt-get install ros-kinetic-combined-robot-hw
        sudo apt-get install ros-kinetic-control-* ros-kinetic-controller-* ros-kinetic-effort-controllers ros-kinetic-position-controllers
        sudo apt-get install ros-kinetic-velocity-controllers ros-kinetic-twist-mux ros-kinetic-diff-drive-controller ros-kinetic-costmap-* ros-kinetic-moveit ros-kinetic-moveit-core ros-kinetic-teb-local-planner ros-kinetic-move-base ros-kinetic-moveit-kinematics ros-kinetic-robot-localization ros-kinetic-combined-robot-hw ros-kinetic-joint-limits-interface ros-kinetic-gmapping ros-kinetic-amcl ros-kinetic-position-controllers ros-kinetic-joint-trajectory-controller ros-kinetic-moveit-visual-tools ros-kinetic-moveit-ros-planning-interface ros-kinetic-ros-control ros-kinetic-ros-controllers ros-kinetic-global-planner ros-kinetic-gazebo-ros-control
        sudo apt-get install ros-kinetic-catkin python-catkin-tools
	
	# Environment Setup
        echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
        source ~/.bashrc

        # Dependencies for building packages
        sudo apt install python-pip python-rosdep python-rosinstall python-rosinstall-generator python-wstool python-catkin-tools
fi

# Ubuntu 18.04LTS
if [ "`lsb_release -cs`" = 'bionic' ]; then
        sudo apt-get install ros-melodic-desktop-full
	sudo apt-get install ros-melodic-eigen-conversions ros-melodic-kdl-parser ros-melodic-effort-controllers ros-melodic-transmission-interface
        sudo apt-get install ros-melodic-gazebo-ros-*
	sudo apt-get install ros-melodic-joint-state*
	sudo apt-get install ros-melodic-combined-robot-hw
	sudo apt-get install ros-melodic-control-* ros-melodic-controller-* ros-melodic-effort-controllers ros-melodic-position-controllers	
        sudo apt-get install ros-melodic-velocity-controllers ros-melodic-twist-mux ros-melodic-diff-drive-controller ros-melodic-costmap-* ros-melodic-moveit ros-melodic-moveit-core ros-melodic-teb-local-planner ros-melodic-move-base ros-melodic-moveit-kinematics ros-melodic-robot-localization ros-melodic-combined-robot-hw ros-melodic-joint-limits-interface ros-melodic-gmapping ros-melodic-amcl ros-melodic-position-controllers ros-melodic-joint-trajectory-controller ros-melodic-moveit-visual-tools ros-melodic-moveit-ros-planning-interface ros-melodic-ros-control ros-melodic-ros-controllers ros-melodic-global-planner ros-melodic-gazebo-ros-control
        sudo apt-get install ros-melodic-catkin
	
	# Environment Setup
        echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
        source ~/.bashrc

        # Dependencies for building packages
        sudo apt install python-pip python-rosdep python-rosinstall python-rosinstall-generator python-wstool python-catkin-tools
fi

# Ubuntu 20.04LTS
if [ "`lsb_release -cs`" = 'focal' ]; then
        sudo apt-get install ros-noetic-desktop-full
	sudo apt-get install ros-noetic-eigen-conversions ros-noetic-kdl-parser ros-noetic-effort-controllers ros-noetic-transmission-interface
        sudo apt-get install ros-noetic-gazebo-ros-*
	sudo apt-get install ros-noetic-joint-state*
	sudo apt-get install ros-noetic-combined-robot-hw
	sudo apt-get install ros-noetic-control-* ros-noetic-controller-* ros-noetic-effort-controllers ros-noetic-position-controllers	
        sudo apt-get install ros-noetic-velocity-controllers ros-noetic-diff-drive-controller ros-noetic-position-controllers ros-noetic-joint-trajectory-controller
	sudo apt-get install ros-noetic-twist-mux ros-noetic-costmap-* ros-noetic-moveit ros-noetic-moveit-core ros-noetic-teb-local-planner ros-noetic-move-base ros-noetic-moveit-kinematics ros-noetic-robot-localization ros-noetic-combined-robot-hw ros-noetic-joint-limits-interface ros-noetic-gmapping ros-noetic-amcl ros-noetic-moveit-visual-tools ros-noetic-moveit-ros-planning-interface ros-noetic-ros-control ros-noetic-ros-controllers ros-noetic-global-planner ros-noetic-gazebo-ros-control
        sudo apt-get install ros-noetic-catkin

        # Environment Setup
        echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
        source ~/.bashrc

        # Dependencies for building packages
        sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
	sudo apt install python3-catkin-tools python3-osrf-pycommon
fi


# Initialize rosdep
sudo rosdep init
rosdep update
