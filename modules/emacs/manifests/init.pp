class emacs {
  $me = $facts['user']

  package { 'emacs': }

  vcsrepo { "/home/${me}/.emacs.d":
    ensure   => present,
    provider => git,
    source   => 'git@github.com:jarpy/prelude.git',
    user     => $me,
    notify   => Exec['bootstrap emacs'],
  }

  file { "/tmp/bootstrap-emacs.el":
    content => template("emacs/bootstrap-emacs.el.erb"),
  }
  ->
  exec { "bootstrap emacs":
    command     => "/usr/bin/emacs --batch --load /tmp/bootstrap-emacs.el",
    unless      => "/bin/stat /home/${me}/.emacs.d/elpa/solarized-theme-*",
    user        => $me,
    environment => [ "HOME=/home/${me}/"],
  }
  ~>
  exec { "setup emacs":
    command     => "/usr/bin/emacs --batch --load /home/${me}/.emacs.d/init.el",
    user        => $me,
    environment => [ "HOME=/home/${me}/"],
    refreshonly => true,
  }
}
