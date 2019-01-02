class fish {
  $me = $facts['user']

  package { 'fish': }

  vcsrepo { "/home/${me}/.config/fish":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/jarpy/fish-config',
    user     => $me,
  }
}
