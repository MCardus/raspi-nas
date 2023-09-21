sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install git -y
git clone https://github.com/MCardus/raspi-nas.git

sh raspi-nas/dhcpcd/install.sh
sh raspi-nas/plex/install.sh
sh raspi-nas/transmission/install.sh
sh raspi-nas/python/install.sh
sh raspi-nas/homeassistant/install.sh
sh raspi-nas/zsh/install.sh
