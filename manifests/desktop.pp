include bash
include git
include ssh
include sudo
include tmux
include x11::session

File {
  owner => $::user,
  group => $::user,
}

Package { ensure => latest }

$python_packages = [
  'awscli',
  'docker-compose',
  'flake8',
  'ipaddr',
  'ipython',
  'mypy',
  'twine',
]

package { $python_packages:
  provider => pip3,
  require  => Package['python3-pip'],
}

$rubygems = [
  'puppet-lint',
  'rspec',
  'rubocop',
]

package { $rubygems:
  provider => 'gem',
  require  => Package['ruby-dev']
}

$packages = [
  'apache2-utils',
  'augeas-tools',
  'automake',
  'build-essential',
  'cifs-utils',
  'curl',
  'direnv',
  'libicu-dev',
  'git',
  'graphviz',
  'jq',
  'letsencrypt',
  'libcurl4-openssl-dev',
  'libevent-dev',
  'libgif-dev',
  'libgnutls28-dev',
  'libgtk-3-dev',
  'libjpeg-dev',
  'libncurses5-dev',
  'libtiff5-dev',
  'libxpm-dev',
  'lynx',
  'lyx',
  'ncurses-term',
  'nmap',
  'openssh-server',
  'openvpn',
  'pry',
  'pwgen',
  'python-pygments',
  'python3-pip',
  'rake',
  'ruby-dev',
  'sshfs',
  'sshpass',
  'texinfo',
  'texlive',
  'texlive-fonts-extra',
  'texlive-generic-extra',
  'texlive-generic-recommended',
  'texlive-latex-extra',
  'tightvncserver',
  'ttf-ancient-fonts-symbola',
  'ttf-bitstream-vera',
  'vim',
  'vim-gnome',
  'wireshark',
  'xclip',
  'x11vnc',
]
package { $packages: }

file { '/usr/share/xsessions/Xsession.desktop':
  content => "[Desktop Entry]\nName=Xsession\nExec=/etc/X11/Xsession\n",
}

# exec {'install_docker':
#   command => '/usr/bin/curl -s https://get.docker.com/ | /bin/bash',
#   unless  => '/usr/bin/stat /usr/bin/docker',
#   require => Package['curl'],
# }

#file { '/etc/ssh/ssh_config':
#  content => template('ssh/ssh_config.erb'),
#  owner   => 'root',
#  group   => 'root',
#}

file { "${::home}/src": ensure => directory }
file { "${::home}/bin": ensure => directory }
