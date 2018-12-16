class tmux {
  $me = $facts['user']

  package { 'tmux':
    ensure => latest
  }

  file { "/home/${me}/.tmux.conf":
    content => template('tmux/tmux.conf.erb'),
    owner   => $::user,
    group   => $::user,
  }
}
