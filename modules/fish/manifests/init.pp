class fish {
  $me = $facts['user']

  package { 'fish': }

  vcsrepo { "/home/${me}/.config/fish":
    ensure   => present,
    provider => git,
    source   => 'git@github.com:jarpy/fish-config.git',
    user     => $me,
  }
}
