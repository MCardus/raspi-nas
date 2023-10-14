# Script Conf
REMOTE_NAME=OneDrive
REMOTE_DIR=$REMOTE_NAME:Apps/rclone-raspi

echo Introduce the backup file name in $REMOTE_DIR\n:
read back_up_file

#download backup file
echo Downloading back up $REMOTE_DIR/$back_up_file
sudo rclone copyto $REMOTE_DIR/$back_up_file /backup.tar.gz --config /home/$(whoami)/.config/rclone/rclone.conf

#unpack all data
echo Unpacking backup
sudo tar -xvf /backup.tar.gz -C /

#restore list of packages
echo Installing back up packages
sudo apt-key add /backup/packages/Repo.keys
sudo cp -R /backup/packages/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dselect update
sudo dpkg --set-selections < /backup/packages/Package.list
sudo apt-get dselect-upgrade -y

# remove tmp dir
echo Cleaning tmp files
sudo rm -r /backup
sudo rm -r /$back_up_file

echo Restarting now
sudo systemctl start reboot.target