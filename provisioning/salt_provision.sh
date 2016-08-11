toilet --gay Install-Salt

# Prepare repository for latest version of salt
sudo apt-get -y install software-properties-common python-software-properties
sudo add-apt-repository ppa:saltstack/salt

# Update apt after adding the above PPA
sudo apt-get update

# Install salt minion on the target machine
sudo apt-get -y install salt-minion

# Copy / set the salt master and minon configuration files?
sudo cp /home/vagrant/CONFIG_FILES/etc/salt/minion /etc/salt/minion

# Update file permissions
sudo chmod 644 /etc/salt/minion
