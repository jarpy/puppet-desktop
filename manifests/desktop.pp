require python

include bash
include keysnail
include tmux

$python_packages = [
  'boto',
  'flake8',
  'ipaddr',
]
python::pip { $python_packages: }


$rubygems = [
  'puppet-lint',
  'rspec',
]
package { $rubygems: provider => 'gem' }


$packages = [
  'alsamixergui',
  'apparmor',
  'automake',
  'avrdude',
  'avr-libc',
  'awesome',
  'awesome-extra',
  'build-essential',
  'dconf-editor',
  'gcc-avr',
  'gconf-editor',
  'docker.io',
  'git',
  'gnome-control-center',
  'gnome-devel',
  'gnome-session-fallback',
  'gpointing-device-settings',
  'graphviz',
  'imagemagick',
  'ipython',
  'ipython-notebook',
  'irssi',
  'klipper',
  'latex-xcolor',
  'libappindicator1',
  'libevent-dev',
  'libgif-dev',
  'libgtk-3-dev',
  'libjpeg-dev',
  'libncurses5-dev',
  'libtiff5-dev',
  'libxpm-dev',
  'lynx',
  'lyx',
  'nmap',
  'nodejs',
  'notification-daemon',
  'openssh-server',
  'openvpn',
  'pavucontrol',
  'pdftk',
  'pidgin',
  'pry',
  'pwgen',
  'python-pygments',
  'rake',
  'rdesktop',
  'remmina',
  'remmina-plugin-rdp',
  'remmina-plugin-vnc',
  'rpm',
  'simulavr',
  'sshfs',
  'texinfo',
  'texlive',
  'texlive-fonts-extra',
  'texlive-generic-extra',
  'texlive-generic-recommended',
  'texlive-latex-extra',
  'ttf-bitstream-vera',
  'vim',
  'vim-gnome',
  'wireshark',
  'x11vnc',
  'xfce4-settings',
  'xfce4-terminal',
  'xscreensaver',
  'xscreensaver-gl',
  'xscreensaver-gl-extra',
]
package { $packages: }


$ati_driver_deps = [
  'dh-modaliases',
  'dkms',
  'execstack',
  'lib32gcc1',
]
# package { $ati_driver_deps: }


file { '/usr/share/xsessions/Xsession.desktop':
  content => "[Desktop Entry]\nName=Xsession\nExec=/etc/X11/Xsession\n",
}

file { '/etc/ssh/ssh_config':
  content => template('ssh/ssh_config.erb'),
  owner   => 'root',
  group   => 'root',
}

file { "${::home}/src": ensure => directory }


File {
  owner => $::user,
  group => $::user,
}
Package { ensure => latest }
