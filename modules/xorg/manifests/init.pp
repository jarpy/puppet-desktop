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
  ->
  file { "/etc/X11/xorg.conf.d/100-touchpad.conf":
    content => template('xorg/touchpad.conf.erb'),
  }

  file { "/home/$me/.xinitrc":
    content => template('xorg/xinitrc.erb'),
    mode    => '0755',
    owner   => $me,
    group   => $me,
  }
}
