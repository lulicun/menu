node local {
    Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }

    class {'::mongodb::globals':
        manage_package_repo => true
    }->
    class {'::mongodb::server':
        bind_ip => ['0.0.0.0']
    }->
    class {'::mongodb::client': }
}


