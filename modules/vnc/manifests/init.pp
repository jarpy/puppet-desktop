class vnc {
  require xorg

  $me = $facts['user']

  package { tigervnc: }

  file { "/home/${me}/.vnc":
    ensure => directory,
    owner  => $me,
    group  => $me,
    mode   => '0755',
  }

  file { "/home/${me}/.vnc/xstartup":
    ensure => link,
    target => "/home/${me}/.xinitrc"
  }
}
