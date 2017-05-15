class eepos {
	exec { 'wget-atom':
		command => '/usr/bin/wget -O /tmp/atom.deb https://atom.io/download/deb',
		path => '/bin/',
		unless => 'ls /tmp/atom.deb',
	}
	package { 'atom':
		provider => 'dpkg',
		ensure => 'latest',
		source => '/tmp/atom.deb',
		require => Exec['wget-atom'],
		allowcdrom => 'true',
	}
	package { 'terminator':
		ensure => 'latest',
		allowcdrom => 'true',
	}
	package { 'tree':
		ensure => 'latest',
		allowcdrom => 'true',
	}
        package {'mumble':
                ensure => 'latest',
                allowcdrom => 'true',
        }
        package {'mumble-server':
                ensure => 'latest',
                allowcdrom => 'true',
        }
        file { '/etc/mumble-server.ini':
                content => template('eepos/mumble-server.ini'),
                notify => Service['mumble-server'],
                require => Package['mumble-server'],
        }
        service {'mumble-server':
                ensure => 'running',
                require => Package['mumble-server'],
        }
}
