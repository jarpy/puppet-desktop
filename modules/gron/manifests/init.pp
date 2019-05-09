class gron(String $version='0.6.0') {
  $src_root = "https://github.com/tomnomnom/gron/releases/download"
  $src = "${src_root}/v${version}/gron-linux-amd64-${version}.tgz"
  $dst = "/usr/local/bin/gron"
  $dst_dir = dirname($dst)

  exec { 'download_gron':
    provider => 'shell',
    command  => "/usr/bin/curl --location -o - ${src} | tar -C ${dst_dir} -xzf -",
    creates  => $dst,
  }
  ->
  file { $dst:
    mode => '0755',
  }
}
