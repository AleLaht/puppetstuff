class mumble {
	package {'mumble':
		ensure => 'latest',
		allowcdrom => 'true',
	}
	package {'mumble-server':
		ensure => 'latest',
		allowcdrom => 'true',
	}
	file { '/etc/mumble-server.ini':
		content => template('mumble/mumble-server.ini'),
		notify => Service['mumble-server'],
		require => Package['mumble-server'],
	}
	service {'mumble-server':
		ensure => 'running',
		require => Package['mumble-server'],
	}
}
