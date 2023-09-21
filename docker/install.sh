curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $USER

sudo apt-get install libffi-dev libssl-dev
sudo pip3 install docker-compose
sudo systemctl enable docker