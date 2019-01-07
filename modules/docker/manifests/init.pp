class docker {
  package { 'docker': }
  ~>
  service { 'docker':
    ensure => running,
    enable => true,
  }

  package { 'docker-compose': }
}
