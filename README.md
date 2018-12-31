My Arch Linux desktop environment, implemented with Puppet.

Bootstrap a new machine (as root) with:

```bash
pacman --noconfirm -Su git
git clone https://github.com/jarpy/puppet-desktop
cd puppet-desktop
./bin/bootstrap USERNAME
```

You now have all the pre-requisites installed and a local user account.
Apply the configuration with your new user:

```
su USERNAME
./bin/apply
```
