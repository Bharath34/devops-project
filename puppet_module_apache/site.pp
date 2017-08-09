define puppt_module_apache::site (
  $mod      = 'puppet_module_apache',
  $template = "${name}.erb",
  $ensure   = 'present',
  $confname = $name,
  $nossl    = 'false',
  $certname = "$::apache::params::server_name",
) {
  $public_fqdn = $::$fqdn
  $public_ssl  = 'true'
  $sitedir     = $::apache::params::sitedir
  $confdir     = $::apache::params::confdir

  file {"${sitedir}/${confname}.conf":
    ensure  => $ensure,
    content => template("puppet_module_apache/${template}"),
    notify  => Class['apache::service'],
    require => File["${confdir}/httpd.conf"],
  }
 
}
