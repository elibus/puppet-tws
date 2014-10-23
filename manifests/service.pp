# == Class tws::service
#
# This class is meant to be called from tws
# It ensure the service is running
#
class tws::service {

  service { $tws::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
