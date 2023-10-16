# How this back up tool work?
* It saves important folders where user conf is located such as /home or /etc

# How to schedule backups creation?
* First install and configure rclone using `install.sh`
* Then schedule the systemd service using `schedule.sh`

# How to recover a given backup?
* First install and configure rclone using `install.sh`
* Then download the latest back up and recover those files and folders which are important for you conf, you may use `recovery.sh` as a source of inspiration.