class ssh {
  $me = $facts['user']

  File {
    owner => $me,
    group => $me,
  }

  package { 'openssh':
    ensure => latest,
  }

  # Generate SSH host keys.
  $ciphers = ['rsa', 'dsa', 'ecdsa', 'ed25519']
  $ciphers.each |String $cipher| {
    $file = "/etc/ssh/ssh_host_${cipher}_key"
    exec { "generate_${cipher}_host_key":
      command => "/usr/bin/ssh-keygen -t ${cipher} -f ${file} -N ''",
      creates => $file,
      require => Package['openssh'],
    }
  }

  file { "/home/${me}/.ssh":
    ensure => directory,
    mode   => '0755',
  }

  file { "/home/${me}/.ssh/authorized_keys":
    content => template('ssh/authorized_keys.erb'),
    mode    => '0600',
  }
}
