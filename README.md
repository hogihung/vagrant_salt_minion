# README

This repo uses Vagrant to quickly spin up an Ubuntu 14.04 Virtual Machine with Salt Minon.  It is meant to be used along with the repo that creates a Salt Master and local Minion.  You can find that repo here:

```
https://github.com/hogihung/vagrant_salt.git
```

*Prerequisites: You will need to have VirtualBox (or equivalent) and Vagrant 1.8+ installed.*

### How to use:

Change to a directory where you would like to clone the project.  For example:

```
cd ~/Documents/vagrant_projects/
```


Clone the repo:

```
git clone https://github.com/hogihung/vagrant_salt.git     (this is the master with local minon repo)
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
vagrant@minion-dave:~$ sudo salt-minion --help
Usage: salt-minion

The Salt minion, receives commands from a remote Salt master.

{--snip--}

You can find additional help about salt-minion issuing "man salt-minion" or on
http://docs.saltstack.org
vagrant@minion-dave:~$
```

### Accept the key for your minion

Switch over to your Salt Master Vagrant VM and review the state of our keys:

```
vagrant@salt:~$ sudo salt-key
Accepted Keys:
first_minion
Denied Keys:
first_minion
Unaccepted Keys:
minion_dave
Rejected Keys:
vagrant@salt:~$
```

Now, we will accept the key for our new minion, minion_dave.

```
# Accept the salt-key for our minion
sudo salt-key -a minion_dave

Example:
vagrant@salt:~$ sudo salt-key -a minion_dave
The following keys are going to be accepted:
Unaccepted Keys:
minion_dave
Proceed? [n/Y] Y
Key for minion minion_dave accepted.
vagrant@salt:~$
```

Confirm that the key was accepted:

```
vagrant@salt:~$ sudo salt-key
Accepted Keys:
first_minion
minion_dave
Denied Keys:
first_minion
Unaccepted Keys:
Rejected Keys:
vagrant@salt:~$
```


### Test connectivity

```
vagrant@salt:~$ sudo salt '*' test.ping
minion_dave:
    True
first_minion:
    True
vagrant@salt:~$
```

Notice how we still have connectivity to our minion that resides on the master server, first_minion.  And we now also have access to our new minion, minion_dave.

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
