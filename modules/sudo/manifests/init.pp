class sudo {
  file_line { "no_password_sudo_for_${user}":
    path => '/etc/sudoers',
    line => "${::user} ALL=(ALL) NOPASSWD: ALL",
  }
}
