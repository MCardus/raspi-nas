sudo apt-get install amule amule-daemon
sudo useradd -m amule
sudo passwd amule
echo \
"""# Configuration for /etc/init.d/amule-daemon

# The init.d script will only run if this variable non-empty.
AMULED_USER="amule"

# You can set this variable to make the daemon use an alternative HOME.
# The daemon will use $AMULED_HOME/.aMule as the directory, so if you
# want to have $AMULED_HOME the real root (with an Incoming and Temp
# directories), you can do `ln -s . $AMULED_HOME/.aMule`.
AMULED_HOME="/home/amule"""" > /etc/default/amule-daemon

sudo service amule-daemon start