class basic_module_tests {

  file { '/tmp/test':
    ensure => file,
    owner  => root,
    group  => root,
  }

}
