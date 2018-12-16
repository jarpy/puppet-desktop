class docker {
  package { 'docker':
    ensure => latest
  }
  ~>
  service { 'docker':
    ensure => running,
    enable => true,
  }
}
