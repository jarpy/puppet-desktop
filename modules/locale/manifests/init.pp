class locale (
  String $charset = 'UTF-8',
  String $lang = "en_GB.${charset}",
)

{
  File {
    owner => root,
    group => root,
    mode  => '0644',
  }

  file { '/etc/locale.gen':
    content => "${lang} ${charset}\n",
  }
  ~>
  exec { '/usr/bin/locale-gen':
    refreshonly => true,
  }

  file { '/etc/locale.conf':
    content => "LANG=${lang}\n",
  }
  ~>
  exec { "/usr/bin/localectl set-locale LANG=${lang}":
    unless  => "/usr/bin/localectl status | grep -q LANG=${lang}",
    require => Exec['/usr/bin/locale-gen'],
  }
}
