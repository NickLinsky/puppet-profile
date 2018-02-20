class profile::base (
  $ntp_servers = [
    '0.ubunto.pool.ntp.org',
    '1.ubunto.pool.ntp.org',
    '2.ubunto.pool.ntp.org',
    '3.ubunto.pool.ntp.org',
  ],
) {
  notify { "Notify: Gets into profile::base":}
  notice ( "Notice: Gets into profile::base")
  #include ::ssh
  #class {'::ntp': 
  #  servers => $ntp_servers,
  #}

  if $facts['os']['family'] == 'RedHat' {
    include ::profile::selinux
  }
}
