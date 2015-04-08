require python
include tmux

$python_packages = [
  'boto',
  'flake8',
  'ipaddr',
]
python::pip { $python_packages: }

$packages = [
  'apparmor',
  'alsamixergui',
  'automake',
  'awesome',
  'awesome-extra',
  'build-essential',
  'dconf-editor',
  'docker.io',
  'gconf-editor',
  'git',
  'graphviz',
  'gnome-control-center',
  'gnome-devel',
  'gnome-session-fallback',
  'gpointing-device-settings',
  'imagemagick',
  'ipython',
  'ipython-notebook',
  'irssi',
  'klipper',
  'libappindicator1',
  'libevent-dev',
  'libgif-dev',
  'libgtk-3-dev',
  'libjpeg-dev',
  'libtiff5-dev',
  'libxpm-dev',
  'lynx',
  'libncurses5-dev',
  'notification-daemon',
  'nmap',
  'pavucontrol',
  'pdftk',
  'pidgin',
  'pry',
  'pwgen',
  'rake',
  'remmina',
  'remmina-plugin-rdp',
  'remmina-plugin-vnc',
  'rpm',
  'wireshark',
  'openssh-server',
  'openvpn',
  'sshfs',
  'rdesktop',
  'texinfo',
  'ttf-bitstream-vera',
  'vim',
  'vim-gnome',
  'x11vnc',
  'xfce4-settings',
  'xfce4-terminal',
  'xscreensaver',
  'xscreensaver-gl',
  'xscreensaver-gl-extra',
]
package { $packages: }

# ATI driver dependencies
#package { 'dh-modaliases': }
#package { 'execstack': }
#package { 'lib32gcc1': }
#package { 'dkms': }

# Typesetting
package { 'lyx': }
package { 'latex-xcolor': }
package { 'texlive': }
package { 'texlive-fonts-extra': }
package { 'texlive-generic-recommended': }
package { 'texlive-generic-extra': }
package { 'texlive-latex-extra': }
package { 'python-pygments': }

package { 'puppet-lint': provider => 'gem', }
package { 'rspec': provider => 'gem', }

file { '/usr/share/xsessions/Xsession.desktop':
  content => "[Desktop Entry]\nName=Xsession\nExec=/etc/X11/Xsession\n",
}

file { '/etc/ssh/ssh_config':
  content => template('ssh/ssh_config.erb'),
  owner   => 'root',
  group   => 'root',
}

file { "${::home}/src":
  ensure => directory,
  owner  => $::user,
  group  => $::user,
}


Package { ensure => latest }
