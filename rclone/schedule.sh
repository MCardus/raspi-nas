sh install.sh
cat systemcmd.txt > /etc/systemd/system/rclone@$(whoami).service
cat systemcmd_timer.txt > /etc/systemd/system/rclone@$(whoami).timer
sudo systemctl enable rclone@$(whoami).timer