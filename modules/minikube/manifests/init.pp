class minikube(String $version='0.32.0') {
  $src = "https://github.com/kubernetes/${name}/releases/download/v${version}/${name}-linux-amd64"
  $dst = "/usr/local/bin/${name}-${version}"
  $symlink = "/usr/local/bin/${name}"

  exec { "download_${name}":
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
