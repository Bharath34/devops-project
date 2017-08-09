class puppet_module_apache::config {
  $public_ssl  = $::puppet_module_apache::params::public_ssl
  $public_fqdn = $::puppet_module_apache::params::public_fqdn
  $confdir     = $::puppet_module_apache::params::confdir
  $sitedir     = $::puppet_module_apache::params::sitedir
  file { "${confdir}/httpd.conf" :
    ensure  => 'present',
    content => template('puppet_module_apache/httpd.conf.erb'),
    notify  => Class['puppet_module_apache::service'],
  }
  file { '/var/log/httpd':
    ensure => 'directory',
    owner  => 'apache',
    group  => 'apache',
    mode   => '0700',
  }
}
