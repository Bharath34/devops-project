define puppet_module_apache::package (
$ensure     = 'present',
){
default: {
      $apache_package = $::apache::params::apache_name
    }
package { 'httpd':
    ensure => $ensure,
    name   => $apache_package,
    notify => Class['puppet_module_apache::Service'],
  }
}
