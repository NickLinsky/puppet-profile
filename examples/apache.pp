class profile::apache(
  Boolean $default_vhost = false,
  String $server_root = '/var/www/',
  Integer $port = 80,
) {

  class {'::apache':
    default_vhost => $default_vhost,
  }

  ::apache::vhost{'homepages':
    port => $port,
    docroot => $server_root
  }

  file {'/var/www':
    ensure => directory,
  }

  file {'/var/www/index.html':
    ensure => file,
    content => 'Test page. This is a test',
    require => File['/var/www'],
  }
}

