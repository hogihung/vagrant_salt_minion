# README

This repo uses Vagrant to quickly spin up an Ubuntu 14.04 Virtual Machine with Salt Master and Salt Minon.

*Prerequisites: You will need to have VirtualBox (or equivalent) and Vagrant 1.8+ installed.*

### How to use:

Change to a directory where you would like to clone the project.  For example:

```
cd ~/Documents/vagrant_projects/
```


Clone the repo:

```
git clone 
```

Spin up your VM using Vagrant

```
vagrant up
```

Login to your new VM

```
vagrant ssh
```

### After you have successfully logged in, test that Salt is working:

```
Example:
vagrant@salt:~$ sudo salt-key
Accepted Keys:
Denied Keys:
Unaccepted Keys:
first_minion
salt
Rejected Keys:
vagrant@salt:~$
```

### Accept the key for your minion

```
# Accept the salt-key for our minion
sudo salt-key -a first_minion
```

### Test connectivity

```
sudo salt '*' test.ping
```

### Exiting / Destroying the VM

To spin down your Vagrant VM:

```
exit
vagrant halt
```

To remove (destroy) the Vagrant VM:

```
vagrant destroy
```

Feel free to review the contents of the Vagrant file, the provisioning files located in /provisioning and the pre-configured minon and master files that will reside in /etc/salt/