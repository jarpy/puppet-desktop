require python
python::pip { 'boto': }
python::pip { 'flake8': }
python::pip { 'ipaddr': }

package { 'apparmor': }
package { 'alsamixergui': }
package { 'awesome': }
package { 'awesome-extra': }
package { 'build-essential': }
package { 'dconf-editor': }
package { 'docker.io': }
package { 'gconf-editor': }
package { 'git': }
package { 'graphviz': }
package { 'gnome-control-center': }
package { 'gnome-devel': }
package { 'gnome-session-fallback': }
package { 'gpointing-device-settings': }
package { 'imagemagick': }
package { 'ipython': }
package { 'ipython-notebook': }
package { 'klipper': }
package { 'libappindicator1': }
package { 'libevent-dev': }
package { 'libgif-dev': }
package { 'libgtk-3-dev': }
package { 'libjpeg-dev': }
package { 'libtiff5-dev': }
package { 'libxpm-dev': }
package { 'lynx': }
package { 'libncurses5-dev': }
package { 'notification-daemon': }
package { 'nmap': }
package { 'pdftk': }
package { 'pidgin': }
package { 'pry': }
package { 'pwgen': }
package { 'rake': }
package { 'remmina': }
package { 'remmina-plugin-rdp': }
package { 'remmina-plugin-vnc': }
package { 'rpm': }
package { 'wireshark': }
package { 'openssh-server': }
package { 'sshfs': }
package { 'rdesktop': }
package { 'tmux': }
package { 'ttf-bitstream-vera': }
package { 'vim': }
package { 'vim-gnome': }
package { 'x11vnc': }
package { 'xfce4-settings': }
package { 'xfce4-terminal': }
package { 'xscreensaver': }
package { 'xscreensaver-gl': }
package { 'xscreensaver-gl-extra': }

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

Package { ensure => latest }
