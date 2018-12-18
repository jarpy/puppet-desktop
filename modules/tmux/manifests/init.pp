class tmux {
  $me = $facts['user']

  package { 'tmux': }

  file { "/home/${me}/.tmux.conf":
    content => template('tmux/tmux.conf.erb'),
    owner   => $::user,
    group   => $::user,
  }
}
