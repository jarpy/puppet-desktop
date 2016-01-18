My desktop environment, implemented with Puppet.
Tested on Ubuntu MATE 15.10.

Bootstrap a freshly installed system with:

```bash
sudo aptitude install --assume-yes git puppet rake
git clone --recursive https://github.com/jarpy/puppet-desktop.git
(cd puppet-desktop && rake)
```
