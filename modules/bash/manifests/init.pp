class bash {

  file { "${::home}/.bashrc":
    content => template('bash/bashrc.erb'),
    owner   => $::user,
    group   => $::user,
   }
}

