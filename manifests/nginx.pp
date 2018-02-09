class profile::nginx (
  Array $vhosts,
) {
  include ::nginx

  $vhosts.each |$vhost| {
    ::nginx::vhost { $vhost['fqdn']:
      port           => $host['port'],
      server_aliases => $vost['server_aliases'],
    }
  }
}
