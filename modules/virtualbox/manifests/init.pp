class virtualbox {
  package { 'virtualbox-host-modules-arch': }
  ->
  package { 'virtualbox': }

  $modules = [
    'vboxdrv',
    'vboxnetadp',
    'vboxnetflt',
  ]

  $modules.each |String $module| {
    exec { "/usr/bin/modprobe ${module}":
      refreshonly => true,
      subscribe   => Package['virtualbox-host-modules-arch']
    }
  }
}
