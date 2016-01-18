class x11::session {
  require x11::packages

  file { "${::home}/.Xsession":
    content => template('x11/xsession.erb'),
  }

  file { "${::home}/.config/xfce4/terminal/terminalrc":
    content => template('x11/terminalrc.erb'),
  }

  file { "${::home}/.config/xfce4/terminal/accels.scm":
    content => ""
  }

  File {
    owner   => $::user,
    group   => $::user,
  }
}
