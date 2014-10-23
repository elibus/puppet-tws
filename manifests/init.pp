# == Class: tws
#
# Full description of class tws here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class tws (
  $package_name = $tws::params::package_name,
  $service_name = $tws::params::service_name,
) inherits tws::params {

  # validate parameters here

  class { 'tws::install': } ->
  class { 'tws::config': } ~>
  class { 'tws::service': } ->
  Class['tws']
}
