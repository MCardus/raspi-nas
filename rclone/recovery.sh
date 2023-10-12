# Script Conf
REMOTE_NAME=OneDrive
REMOTE_DIR=$REMOTE_NAME:Apps/rclone-raspi

#download backup file
sudo rclone copyto $(REMOTE_DIR)/backup.tar.gz /backup.tar.gz --config /home/marcus/.config/rclone/rclone.conf

#unpack all data
sudo tar -xvf /backup.tar.gz /

#restore list of packages
sudo apt-key add /backup/packages/Repo.keys
sudo cp -R /backup/packages/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dselect update
sudo dpkg --set-selections < /backup/packages/Package.list
sudo apt-get dselect-upgrade -y

# remove tmp dir
sudo rm -r /backup