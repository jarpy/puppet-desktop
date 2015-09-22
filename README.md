My desktop environment, implemented with Puppet.
Tested on Linux Mint 17; probably works on Ubuntu 14.04.

Bootstrap a freshly built system with:

```bash
sudo aptitude install --assume-yes git puppet rake
git clone --recursive https://github.com/jarpy/puppet-desktop.git
(cd puppet-desktop && rake)
```
