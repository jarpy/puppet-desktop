#!/bin/bash

wget https://apt.puppetlabs.com/puppetlabs-release-pc1-wily.deb
dpkg -i puppetlabs-release-pc1-wily.deb
rm puppetlabs-release-pc1-wily.deb
sudo aptitude install --assume-yes git puppet-agent rake
#git clone --recursive https://github.com/jarpy/puppet-desktop.git
#(cd puppet-desktop && rake)
