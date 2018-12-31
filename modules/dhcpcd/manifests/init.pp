class dhcpcd (Array[String] $interfaces=[]) {
  $interfaces.each |String $interface| {
    service { "dhcpcd@${interface}":
      ensure => running,
      enable => true,
    }
  }
}
