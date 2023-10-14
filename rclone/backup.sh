# Script Conf
export REMOTE_NAME=OneDrive
export REMOTE_DIR=${REMOTE_NAME}:Apps/rclone-raspi

#re-create a backup directory
echo Creating tmp backup folder
sudo rm -rf /backup
sudo mkdir /backup
sudo mkdir /backup/packages
sudo chown -R $(whoami) /backup


#copy a package list
echo Backing up installed packages
dpkg --get-selections > /backup/packages/Package.list
cp -R /etc/apt/sources.list* /backup/packages/
apt-key exportall > /backup/packages/Repo.keys

#compress directories
echo Compressing back up folders
sudo tar -czf /backup/backup.tar.gz /home /etc /usr/local/etc /backup/packages /var/lib/docker/volumes/

#send to the cloud
echo Saving backup to $REMOTE_DIR
export TODAY_DATE=$(date '+%Y-%m-%d')
rclone copyto /backup/backup.tar.gz $REMOTE_DIR/backup-$TODAY_DATE.tar.gz
#rclone delete $REMOTE_DIR/backup-latest.tar.gz
#rclone copyto $REMOTE_DIR/backup-$TODAY_DATE.tar.gz $REMOTE_DIR/backup-latest.tar.gz

#delete old backups
export TIME_THRESHOLD=4d
echo Deleting backups older than $TIME_THRESHOLD
rclone delete $REMOTE_DIR --min-age $TIME_THRESHOLD

#delete the temporary directory
echo Deleting back up tmp folder
sudo rm -r /backup