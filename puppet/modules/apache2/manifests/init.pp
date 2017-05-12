class apache2 {
	package {apache2:
		ensure => 'installed',
	}
	file {'/var/www/html/index.html':
		content => "Moikka maailma!",
		require => Package['apache2'],
	}	
}
