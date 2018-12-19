class browsh(String $version='1.5.0') {
  $src = "https://github.com/browsh-org/browsh/releases/download/v${version}/browsh_${version}_linux_amd64"
  $dst = "/usr/local/bin/browsh-${version}"
  $symlink = '/usr/local/bin/browsh'

  # Error: /Stage[main]/Browsh/File[/usr/local/bin/browsh]: Could not evaluate: Could not retrieve information from
  # environment production source(s) https://github.com/browsh-org/browsh/releases/download/v1.5.0/browsh_1.5.0_linux_amd64
  # file { $dst:
  #   source   => $src,
  #   mode     => '0755',
  # }

  exec { 'download_browsh':
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
