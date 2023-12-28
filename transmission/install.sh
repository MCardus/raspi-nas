# https://pimylifeup.com/raspberry-pi-transmission/
sudo systemctl stop transmission-daemon
sudo mkdir -P /mnt/toshiba/downloads
sudo chown -R debian-transmission:debian-transmission /mnt/toshiba/downloads
cp transmission/settings.json /etc/transmission-daemon/settings.json
sudo systemctl start transmission-daemon