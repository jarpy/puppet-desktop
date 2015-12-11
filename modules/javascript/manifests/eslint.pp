class javascript::eslint {
  file { "${::home}/.eslintrc":
    content => template('javascript/eslintrc.erb'),
  }
}

