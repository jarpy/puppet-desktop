class ntp {
  package { 'ntp': }

  service { 'ntpd':
    ensure => running,
    enable => true,
  }
}
