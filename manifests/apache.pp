class profile::apache (
  Boolean $default_vhost = true,
  Integer $port = 80,
  String $docroot = "/var/www/${facts['fqdn']}",
) {
  class { '::apache':
    default_vhost => $default_vhost,
  }

  ::apache::vhost { $facts['fqdn']:
    port    => $port,
    docroot => $docroot,
    before  => File["${docroot}/index.html"]
  }

  file { "${docroot}/index.html":
    content => "Test page <br> This is a test",
  }
}
