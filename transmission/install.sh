# https://pimylifeup.com/raspberry-pi-transmission/
sudo systemctl stop transmission-daemon
sudo mkdir /downloads
sudo chown -R debian-transmission:debian-transmission /downloads
# Edit /etc/transmission-daemon/settings.json
# "download-dir": "/downloads",
# "rpc-authentication-required": false,
# "rpc-whitelist": "127.0.0.1,192.168.*.*",