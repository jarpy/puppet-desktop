class ssh {
  $me = $facts['user']

  package { 'openssh': }

  # Generate SSH host keys.
  $ciphers = ['rsa', 'dsa', 'ecdsa', 'ed25519']
  $ciphers.each |String $cipher| {
    $file = "/etc/ssh/ssh_host_${cipher}_key"
    exec { "generate_${cipher}_host_key":
      command => "/usr/bin/ssh-keygen -t ${cipher} -f ${file} -N ''",
      creates => $file,
      require => Package['openssh'],
      notify  => Service['sshd'],
    }
  }

  service { 'sshd':
    ensure => running,
    enable => true,
  }

  file { "/home/${me}/.ssh":
    ensure => directory,
    mode   => '0755',
    owner  => $me,
    group  => $me,
  }

  file { "/home/${me}/.ssh/authorized_keys":
    content => template('ssh/authorized_keys.erb'),
    mode    => '0600',
    owner   => $me,
    group   => $me,
  }

  file { "/root/.ssh":
    ensure => directory,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { "/root/.ssh/authorized_keys":
    content => template('ssh/authorized_keys.erb'),
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
  }
}
