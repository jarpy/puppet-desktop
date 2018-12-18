class locale (
  String $language = "en",
  String $territory = "GB",
  String $codeset = "UTF-8",
)

{
  File {
    owner => root,
    group => root,
    mode  => '0644',
  }

  Exec {
    path => '/usr/bin',
  }

  $lang = "${language}_${territory}.${codeset}"
  file { '/etc/locale.gen':
    content => "${lang} ${codeset}\n",
  }
  ~>
  exec { 'locale-gen':
    refreshonly => true,
  }

  file { '/etc/locale.conf':
    content => "LANG=${lang}\n",
  }
  ~>
  exec { "localectl set-locale LANG=${lang}":
    unless  => "localectl status | grep -q LANG=${lang}",
    require => Exec['locale-gen'],
  }
}
