define puppet_module_apache::cert {
  $certname    = $::fqdn
  $public_ssl  = $::apache::params::public_ssl
  $server_name = $::fqdn
  $service     = $::apache::params::service
  $outputdir   = "/etc/pki/tls/certs"
  $template    = "${outputdir}/template"
  $private     = $::apache::params::private
    file { $outputdir:
    ensure  => 'directory',
    }
  
    file { $template :
      ensure  => 'present',
      content => template('apache/ssleaytemplate.erb'),
      require => File[$outputdir],
    }
    exec { 'gencrtkey' :
      path        => $::path,
      command     => "openssl req -config ${template} -new -x509 -nodes -days 3650 -out ${outputdir}/${certname}.crt -keyout ${private}/${certname}.key",
      environment => 'RANDFILE=/dev/random',
      creates     => "${outputdir}/${certname}.key",
      require     => File[$template],
    }
    exec { 'gencsr':
      path        => '/usr/local/bin:/usr/bin',
      command     => "openssl req -new -key ${private}/${certname}.key -config ${template} -out ${outputdir}/${certname}.csr || exit 1",
      environment => 'RANDFILE=/dev/random',
      creates     => "${outputdir}/${certname}.csr",
      require     => Exec['gencrtkey']
    }
  }
