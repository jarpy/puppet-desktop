class bash {

  file { "${::home}/.bashrc":
    content => template('bash/bashrc.erb'),
  }

  file { "${::home}/.inputrc":
    content => template('bash/inputrc.erb'),
  }

  file { "${::home}/bin/git-completion.bash":
    content => template('bash/git-completion.bash.erb'),
  }

  file { "${::home}/bin/git-prompt.sh":
    content => template('bash/git-prompt.sh.erb'),
  }

  file { "${::home}/.dircolors":
    content => template('bash/dircolors.erb'),
  }

  File {
    require => File["${::home}/bin"]
  }
}

