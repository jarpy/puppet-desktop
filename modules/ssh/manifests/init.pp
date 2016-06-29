class ssh {
  file { "${::home}/.ssh":
    ensure => directory,
    mode   => '0755',
  }

  file { "${::home}/.ssh/authorized_keys":
    content => template('ssh/authorized_keys.erb'),
    mode    => '0600',
  }

  File {
    owner => $::user,
    group => $::user,
  }
}
