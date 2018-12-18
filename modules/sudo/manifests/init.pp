class sudo {
  $me = $facts['user']

  package { 'sudo': }
  ->
  file { "no_password_sudo_for_${me}":
    path    => "/etc/sudoers.d/${me}",
    content => "${me} ALL=(ALL) NOPASSWD: ALL",
  }
}
