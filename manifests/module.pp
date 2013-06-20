define easyinstall::module {

    include easyinstall

    $mod_name = "$name"
    $mod_record = "$easyinstall::record_dir/$mod_name"
    exec { "easy-install-$mod_name":
        command => "easy_install --record '$mod_record' $mod_name",
        require => Package["$easyinstall::package"],
        creates => "$mod_record",
        logoutput => on_failure,
        path => '/usr/bin:/bin:/usr/sbin:/sbin',
    }

}
