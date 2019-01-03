class termite {
  $me = $facts['user']

  package { 'termite': }

  file { "/home/${me}/.config/termite":
    ensure => directory,
  }

  file { "/home/${me}/.config/termite/config":
    content => template('termite/config.erb'),
    owner   => $::user,
    group   => $::user,
  }
}
