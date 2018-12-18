class git {
  $me = $facts['user']

  File {
    owner => $me,
    group => $me,
  }

  package { 'git': }

  file { "/home/${me}/.gitconfig":
    content => template('git/gitconfig.erb'),
  }

  file { "/home/${me}/.gitignore":
    content => template('git/gitignore.erb'),
  }
}
