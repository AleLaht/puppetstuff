class ssh {
	package {'ssh':
		ensure => 'installed',
	}
	file {'/etc/ssh/sshd_config':
		content => template('ssh/sshd_config'),
		notify => Service['ssh'],
		require => Package['ssh'],
	}
	service {'ssh':
		ensure => 'running',
		require => Package['ssh'],
	}
}
