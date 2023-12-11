sudo apt install cups
sudo usermod -a -G lpadmin $USER
sudo cupsctl --remote-any
sudo apt install avahi-daemon
sudo systemctl restart cups