class tmux {
  package { 'tmux': ensure => latest }

  file { "${::home}/.tmux.conf":
    content => template('tmux/tmux.conf.erb'),
    owner   => $::user,
    group   => $::user,
  }
}
