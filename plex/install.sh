# https://pimylifeup.com/raspberry-pi-plex-server/

sudo apt-get install apt-transport-https
curl https://downloads.plex.tv/plex-keys/PlexSign.key | gpg --dearmor | sudo tee /usr/share/keyrings/plex-archive-keyring.gpg >/dev/null
sudo apt-get update
sudo apt install plexmediaserver
