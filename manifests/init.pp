class easyinstall($package = 'python-setuptools', $record_dir = '/var/lib/puppet/easy_install') {

   file { "$record_dir":
      ensure => 'directory',
      mode => '0755',
      owner => 'root',
      group => 'root',
   }

   if !defined(Package["$package"]) {
      package { "$package":
         ensure => 'installed',
         require => File["$record_dir"]
      }
   }

}

