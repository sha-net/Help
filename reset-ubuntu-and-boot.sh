find /boot | grep generic | grep -v 4.4.0-8 | grep -v `uname -r` | xargs rm -f
mv /usr/local/bin/docker-compose /usr/local/bin/docker-composeOLD
apt-get remove linux-image-4.4.0-109* -y
dpkg --configure -a
apt-get update
apt-get -f install
apt-get remove docker-engine -y
apt-get autoremove -f -y
puppet agent -t
