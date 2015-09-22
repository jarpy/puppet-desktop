require python

include bash
include keysnail
include tmux
include x11::session

$python_packages = [
  'awscli',
  'boto',
  'flake8',
  'ipaddr',
]
python::pip { $python_packages: }


$rubygems = [
  'cucumber',
  'puppet-lint',
  'rspec',
]
package { $rubygems:
  provider => 'gem',
  require  => Package['ruby-dev']
}

$packages = [
  'apparmor',
  'augeas-tools',
  'automake',
  'avrdude',
  'avr-libc',
  'build-essential',
  'gcc-avr',
  'docker.io',
  'dropbox',
  'git',
  'gnuradio',
  'graphviz',
  'imagemagick',
  'ipython',
  'ipython-notebook',
  'irssi',
  'latex-xcolor',
  'libappindicator1',
  'libcurl4-openssl-dev',
  'libevent-dev',
  'libgif-dev',
  'libgtk-3-dev',
  'libjpeg-dev',
  'libncurses5-dev',
  'libtiff5-dev',
  'libxpm-dev',
  'lynx',
  'lyx',
  'mono-complete',
  'ncurses-term',
  'nmap',
  'nodejs',
  'notification-daemon',
  'ntp',
  'openssh-server',
  'openvpn',
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
  'ruby-dev',
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
