class puppet_module_apache::params {
 $apache_name          = 'httpd',
 $public_ssl           = 'true',
 $public_fqdn          = '$fqdn'
 $confdir              = "/etc/${service}/conf",
 $service              = 'httpd',
 $sitedir              = "/etc/${service}/conf.d",
 $service_name         = 'httpd'
 }
