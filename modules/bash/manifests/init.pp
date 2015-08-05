class bash {

  file { "${::home}/.bashrc":
    content => template('bash/bashrc.erb'),
  }

  file { "${::home}/.inputrc":
    content => template('bash/inputrc.erb'),
  }
}

