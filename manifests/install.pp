# == Class tws::install
#
class tws::install {

  package { $tws::package_name:
    ensure => present,
  }
}
