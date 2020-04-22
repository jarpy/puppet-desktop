# require python

#include bash
include browsh
include direnv
include dhcpcd
include docker
include emacs
include fish
include git
include gron
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
#  'ansible',
#  'awscli',
#  'docker-compose',
#  'flake8',
  'grip',
#  'ipaddr',
  'jsonrpclib',
  'ipython',
#  'twine',
]

package { $python_packages:
  provider => pip,
  require  => Package['python-pip'],
}

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
  'autocutsel',
  'aws-cli',
  'base',
  'base-devel',
  'bat',
  'bind-tools',
  'chromium',
  'clojure',
  'copyq',
  'efibootmgr',
  'exa',
  'expect',
  'firefox',
  'freerdp',
  'fd',
  'fzf',
  'gvim',
  'hub',
  'jq',
  'lastpass-cli',
  'lsof',
  'maim',
  'mercurial',
  'mpg123',
  'moreutils',
  'mosh',
  'mtr',
  'nmap',
  'npm',
  'noto-fonts-emoji',
  'openssl-1.0',
  'openvpn',
  'otf-ipafont',
  'packer',
  'pacman-contrib', # REF: https://bugs.archlinux.org/task/58766
  'pacmatic',
  'pavucontrol',
  'pulseaudio',
  'pulseaudio-alsa',
  'pwgen',
  'python2',
  'python-black',
  'python-pip',
  'python-virtualenv',
  'python-yapsy',
  'ripgrep',
  'ruby-bundler',
  'sshpass',
  'strace',
  'task',
  'time',
  'ttf-bitstream-vera',
  'vagrant',
  'vault',
  'vit',
  'xclip',
  'xdotool',
  'xsel',
  'xorg-xprop',
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
#sysctl { "vm.max_map_count":
#  ensure  => present,
#  value   => "262144",
#  persist => true,
#}
