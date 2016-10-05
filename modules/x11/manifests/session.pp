class x11::session {
  require x11::packages

  file { "${::home}/.Xsession":
    content => template('x11/xsession.erb'),
  }

  file { "${::home}/.config/xfce4/terminal":
    ensure => directory,
  }

  file { "${::home}/.config/xfce4/terminal/terminalrc":
    content => template('x11/terminalrc.erb'),
  }

  file { "${::home}/.config/xfce4/terminal/accels.scm":
    content => template('x11/accels.scm.erb'),
  }

  file { "${::home}/bin/slow-mouse":
    content => template('x11/slow-mouse.sh.erb'),
    mode    => '0755',
  }

  File {
    owner   => $::user,
    group   => $::user,
  }
}
