# == Class tws::params
#
# This class is meant to be called from tws
# It sets variables according to platform
#
class tws::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'tws'
      $service_name = 'tws'
    }
    'RedHat', 'Amazon': {
      $package_name = 'tws'
      $service_name = 'tws'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
