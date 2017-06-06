require python

include bash
include sudo
include tmux

file { "${::home}/src": ensure => directory }
file { "${::home}/bin": ensure => directory }

File {
  owner => $::user,
  group => $::user,
}
Package { ensure => latest }
