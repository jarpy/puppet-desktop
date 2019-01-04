class console (
  $font = 'ter-d22n',
  $font_map = '8859-2',
)

{
  $font_packages = [
    'tamsyn-font',
    'terminus-font',
  ]
  
  $font_packages.each |String $package| {
    package { $package: 
      ensure => present,
    }
  }

  file { '/etc/vconsole.conf':
    content => "FONT=${font}\nFONT_MAP=${font_map}",
  }
  
  $ctl_file = '/sys/class/graphics/fbcon/cursor_blink'
  exec { 'console_cursor_no_blink':
    command  => "/bin/echo 0 > $ctl_file",
    provider => shell,
    unless   => "/usr/bin/grep -q '^0$' $ctl_file",
  }
}
