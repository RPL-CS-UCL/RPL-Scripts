# scripts
Commonly used scripts

# Support
- Ubuntu 16.04LTS and 18.04LTS
- ROS Kinetic and Melodic

# Installation Instructions
## Basic Setup: git, cmake

1. Install basic GIT and cmake packages:
```bash
sudo apt-get install git cmake cmake-curses-gui
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

8. Add those, after adding your ROS version (kinetic,melodic) and the exact path to the robotology-setup.bash, into your **.bashrc** file (thus updating your ENV variables) and restart the terminal (or `source ~/.bashrc`):
```bash
. /opt/ros/ROS_VERSION/setup.bash
```
