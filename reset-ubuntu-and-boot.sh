find /boot | grep generic | grep -v 4.4.0-8 | grep -v `uname -r` | xargs rm -f
dpkg --configure -a
apt-get update
apt-get -f install
apt-get remove docker-engine -y
apt-get autoremove -f -y
puppet agent -t
