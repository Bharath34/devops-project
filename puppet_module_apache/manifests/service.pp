class puppet_module_apache::service (
  $service_name   = $::puppet_module_apache::params::service_name,
  $service_enable = true,
  $service_ensure = 'running',
) 
 {
  service { 'httpd':
    ensure => $service_ensure,
    name   => $service_name,
    enable => $service_enable,
  }
}
