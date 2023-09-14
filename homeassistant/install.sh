PYTHON_VERSION=3.11.5
pyenv install $PYTHON_VERSION
pyenv virtualenv $PYTHON_VERSION home-assistant
pyenv activate home-assistant

sudo apt-get install -y bluez libffi-dev libssl-dev libjpeg-dev zlib1g-dev autoconf build-essential libopenjp2-7 \
  libtiff5 libturbojpeg0-dev tzdata ffmpeg liblapack3 liblapack-dev libatlas-base-dev

sudo useradd -rm homeassistant -G dialout,gpio,i2c
pip3 install homeassistant
cat systemcmd.txt >/etc/systemd/system/home-assistant@$(whoami).service
sudo systemctl start home-assistant@$(whoami).service
