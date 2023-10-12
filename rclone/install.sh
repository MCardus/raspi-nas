sudo apt-get -y install rclone
cat systemcmd.txt > /etc/systemd/system/rclone@$(whoami).service
rclone config
