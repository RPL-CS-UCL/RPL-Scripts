# RPL scripts
Commonly used scripts

# Support
> Note: The current version of Ubuntu used at RPL is 20.04LTS with ROS Noetic
- Ubuntu 16.04LTS, 18.04LTS, 20.04LTS
- ROS Kinetic, Melodic, Noetic

# Installation Instructions
## Basic Setup: git, cmake

1. Install basic GIT and cmake packages:
```bash
sudo apt-get install git cmake cmake-curses-gui terminator vim net-tools
```

2. Configure GIT, with your own credentials:
```bash
git config --global user.name "Dimitrios Kanoulas"
git config --global user.email "dimitrios.kanoulas@example.com"
git config --global color.pager true
git config --global color.ui auto
```

3. Create new SSH key (public/private rsa key pair), with your own credentials:
```bash
ssh-keygen -t rsa -C "dimitrios.kanoulas@example.com"
```

4. Add RSA identity to the authentication agent:
```bash
ssh-add
cat ~/.ssh/id_rsa.pub
```

5. Add the extracted ssh-rsa key into your host ssh keys, e.g. for github in github-keys (https://github.com/settings/keys).

6. Add the following to your ~/.baschrc:
```bash
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
```
7. Install the basic dependencies
```bash
git clone https://github.com/rpl-as-ucl/scripts.git
cd scripts
sudo chmod u+x basic_setup.sh
./basic_setup.sh
```
* for noetic, there is a crash.  Run > sudo apt -o Dpkg::Options::="--force-overwrite" --fix-broken install

8. Add those, after adding your ROS version (kinetic,melodic) into your **.bashrc** file (thus updating your ENV variables) and restart the terminal (or `source ~/.bashrc`).  Replace ROS_VERSION with either [kinetic, melodic, noetic] depending on which version you installed:
```bash
echo "source /opt/ros/ROS_VERSION/setup.bash" >> ~/.bashrc
. /opt/ros/ROS_VERSION/setup.bash
```

9. Dependencies for building packages.

For python2 (in kinetic, melodic):
```bash
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo rosdep init
rosdep update
```

For python3 (in noetic):
```bash
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install python3-catkin-tools python3-osrf-pycommon
sudo rosdep init
rosdep update
```

10. Video/Images Tools
```bash
sudo apt install gimp inkscape openshot handbrake
```
# Installing PCL/OpenCV
For kinetic, melodic:
```bash
```

For noetic:
```bash
sudo apt install ros-noetic-perception-pcl ros-noetic-pcl-*
sudo apt install ros-noetic-cv-bridge
sudo apt install ros-noetic-openni2-*
sudo apt-get install ros-noetic-tf2-tools
```
# Installing RealSense
For kinetic, melodic:
```bash
sudo apt-get install ros-melodic-realsense2-*
sudo mv 99-realsense-libusb.rules /etc/udev/rules.d/
```

# Installing WiFi Adapter (Brostrend AC1200 Realtek Semiconductor Corp.)
```bash
sudo apt update
sudo apt install dkms bc git
git clone https://github.com/cilynx/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959
sudo dkms add ./rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959
sudo dkms install -m rtl88x2bu -v 5.3.1
sudo modprobe 88x2bu
```

# Installing NVIDIA Drivers (Ubuntu 18.04 LTS)
```bash
ubuntu-drivers devices
sudo ubuntu-drivers autoinstall
```

# Installing VRviz Drivers (Ubuntu 18.04 LTS)
```bash
> sudo apt-get install libglew-dev libassimp-dev
> sudo add-apt-repository multiverse
> sudo apt install steam
> sudo apt install steam-devices
> sudo apt install libvulkan1
> steam
```
