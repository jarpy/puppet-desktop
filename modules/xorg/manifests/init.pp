class xorg {
  $me = $facts['user']

  $packages = [
    'awesome',
    'xorg-server',
    'xorg-xinit',
    'xf86-video-intel',
    'xterm',
  ]
  package { $packages: }

  file { "/home/$me/.xinitrc":
    content => template('xorg/xinitrc.erb'),
    mode    => '0755',
    owner   => $me,
    group   => $me,
  }
}
