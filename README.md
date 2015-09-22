My desktop environment, implemented with Puppet.
Tested on Linux Mint 17.2 MATE.

Bootstrap a freshly installed system with:

```bash
sudo aptitude install --assume-yes git puppet rake
git clone --recursive https://github.com/jarpy/puppet-desktop.git
(cd puppet-desktop && rake)
```
