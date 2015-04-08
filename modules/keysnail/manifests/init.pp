class keysnail {

  file { "${::home}/.keysnail.js":
    content => template('keysnail/keysnail.js.erb'),
    owner   => $::user,
    group   => $::user,
  }
}
