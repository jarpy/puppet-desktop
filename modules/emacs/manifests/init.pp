class emacs {
  $me = $facts['user']

  package { 'emacs': }

  vcsrepo { "/home/${me}/.emacs.d":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/jarpy/prelude',
    user     => $me,
  }
}
