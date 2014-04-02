class mean {
	# Install Node
	package {'node':
		ensure => installed
	}

	# Install NPM (Node Package Manager)
	package {'npm':
		ensure => installed
		require => Package['node']
	}

	# Install MongoDB
	package {'mongodb':
		ensure => installed
	}

	# Install Express
	exec {'expressInstall':
		require => [Package['npm'], Package['node']]
	}
}
