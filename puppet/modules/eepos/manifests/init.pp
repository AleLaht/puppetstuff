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
	}
	package { 'terminator':
		ensure => 'latest',
	}
	file {'/$HOME/$USER/.config/terminator/config':
		content => template('eepos/config'),
		require => Package['terminator'],
	}
	package { 'tree':
		ensure => 'installed',
	}
	
}
