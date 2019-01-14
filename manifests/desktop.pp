# require python

#include bash
include browsh
include direnv
include dhcpcd
include docker
include emacs
include fish
include git
include locale
include minikube
include ntp
include ssh
include sudo
include termite
include tmux
include virtualbox
include vnc
include xorg
#include x11::session

$me = $facts['user']

File {
  owner   => $me,
  group   => $me,
  require => User[$me]
}

service { 'fstrim.timer':
  enable => true,
}

$python_packages = [
  'ansible',
  'awscli',
  'docker-compose',
  'flake8',
  'ipaddr',
  'ipython',
  'twine',
]
#python::pip { $python_packages: }


$rubygems = [
  'cucumber',
  'puppet-lint',
  'rspec',
  'rubocop',
]
#package { $rubygems:
#  provider => 'gem',
#  require  => Package['ruby-dev']
#}

$packages = [
  'aspell',
  'aspell-en',
  'base-devel',
  'chromium',
  'efibootmgr',
  'firefox',
  'freerdp',
  'fzf',
  'jq',
  'lsof',
  'maim',
  'mercurial',
  'mosh',
  'mtr',
  'nmap',
  'openssl-1.0',
  'openvpn',
  'otf-ipafont',
  'packer',
  'pacmatic',
  'pwgen',
  'python-black',
  'python-virtualenv',
  'sshpass',
  'strace',
  'ttf-bitstream-vera',
  'vagrant',
  'vault',
  'vim',
  'xclip',
]
package { $packages: }

user { $me:
  home       => "/home/${me}",
  managehome => true,
  shell      => '/usr/bin/fish',
  groups     => [
    'docker',
  ],
  require    => [
    Package['docker'],
  ]
}

#file { '/usr/share/xsessions/Xsession.desktop':
#  content => "[Desktop Entry]\nName=Xsession\nExec=/etc/X11/Xsession\n",
#}

#file { '/etc/ssh/ssh_config':
#  content => template('ssh/ssh_config.erb'),
#  owner   => 'root',
#  group   => 'root',
#}

file { "/home/${me}/src": ensure => directory }
file { "/home/${me}/bin": ensure => directory }

# Elasticsearch demands this.
sysctl { "vm.max_map_count":
  ensure => present,
  value  => "262144",
}
