My desktop environment. Tested on Linux Mint 17.

Bootstrap a fresh Mint install with:

```bash
sudo aptitude install --assume-yes git puppet rake
git clone https://github.com/jarpy/puppet-desktop.git
(cd puppet-desktop && rake)
```
