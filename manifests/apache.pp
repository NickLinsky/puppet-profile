class profile::apache(
  Boolean $default_vhost = false,
  Hash $apache_vhost_servers,
  #String docroot = '/var/www/',
  #Integer $port = 80,
) {

  class {'::apache':
    default_vhost => $default_vhost,
  }

  create_resources(::apache::vhost, $apache_vhost_servers)
  #::apache::vhost{'homepages':
  #  port => $port,
  #  docroot => $docroot
  #}

  file {'/var/www':
    ensure => directory,
  }

  file {'/var/www/index.html':
    ensure => file,
    content => 'Test page. This is a test',
    require => File['/var/www'],
  }
}

