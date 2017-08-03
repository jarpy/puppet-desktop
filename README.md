My desktop environment, implemented with Puppet.
Tested on Windows Subsystem for Linux.

Bootstrap a freshly installed system with:

```bash
sudo apt-get install -y aptitude
wget -P /tmp https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo dpkg -i /tmp/puppetlabs-release-pc1-xenial.deb
sudo aptitude update
sudo aptitude install --assume-yes git puppet-agent rake
git clone --recursive https://github.com/jarpy/puppet-desktop.git
(cd puppet-desktop && git checkout wsl && rake)
```
