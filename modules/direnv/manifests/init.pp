class direnv(String $version='2.18.2') {
  $src = "https://github.com/direnv/direnv/releases/download/v${version}/direnv.linux-amd64"
  $dst = "/usr/local/bin/direnv-${version}"
  $symlink = '/usr/local/bin/direnv'

  exec { 'download_direnv':
    command => "/usr/bin/curl --location -o ${dst} ${src}",
    creates => $dst,
  }
  ->
  file { $dst:
    mode => '0755',
  }
  ->
  file { $symlink:
    ensure => link,
    target => $dst,
  }
}
