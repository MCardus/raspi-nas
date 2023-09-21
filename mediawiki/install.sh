mkdir ~/mediawiki
cp docker-compose.yml ~/mediawiki

cat systemcmd.txt > /etc/systemd/system/media-wiki@$(whoami).service
cp LocalSettings.php ~/mediawiki
sudo systemctl --system daemon-reload
sudo systemctl start media-wiki@$(whoami).service