class x11::session {
  require x11::packages

  file { "${::home}/.Xsession":
    content => template('x11/xsession.erb'),
    owner   => $::user,
    group   => $::user,
  }
}
