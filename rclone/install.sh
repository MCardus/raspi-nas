 sudo apt-get -y install rclone
 rclone config
 cat systemcmd.txt > /etc/systemd/system/rclone@$(whoami).service
