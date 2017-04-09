class puppetstuff {
	package {'ssh'
		ensure => 'installed'
	}
	file {'/etc/ssh/sshd_config'
	}
}
