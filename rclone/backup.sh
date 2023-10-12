# Script Conf
export REMOTE_NAME=OneDrive
export REMOTE_DIR=$REMOTE_NAME:Apps/rclone-raspi


#re-create a backup directory
sudo rm -rf /backup
sudo mkdir /backup
sudo mkdir /backup/packages
sudo chown -R $(whoami) /backup


#copy a package list
dpkg --get-selections > /backup/packages/Package.list
cp -R /etc/apt/sources.list* /backup/packages/
apt-key exportall > /backup/packages/Repo.keys

#compress directories
sudo tar -czf /backup/backup.tar.gz /home /etc /usr/local/etc /backup/packages

#send to the cloud
rclone copyto /backup/backup.tar.gz $REMOTE_DIR/backup.tar.gz

#delete old backups
rclone delete $REMOTE_DIR/backup.tar.gz --min-age 7d

#delete the temporary directory
sudo rm -r /backup