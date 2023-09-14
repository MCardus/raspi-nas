# https://pimylifeup.com/raspberry-pi-transmission/
sudo systemctl stop transmission-daemon
sudo mkdir /downloads
sudo chown -R debian-transmission:debian-transmission /downloads
cp transmission/settings.json /etc/transmission-daemon/settings.json