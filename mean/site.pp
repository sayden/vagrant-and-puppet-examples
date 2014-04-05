# MEAN

	package{'nodejs': ensure => installed }						# Install Node
	package{'npm': ensure => installed }						# Install NPM
	package {'wget': ensure => installed }						# Install wget	
	package {'mongodb-server': ensure => installed }				# Install MongoDB
	exec {'create-ddbb-folder': command => '/bin/mkdir /opt/mongodb' }		# Creates a folder for the mongodb ddbb
	exec {'project-directory': command => "/bin/mkdir -p /var/www/mean/public/js"}	# Creates a folder for the project

	### Configure MongoDB
	exec {'configure-mongodb':
		require => [Package['mongodb-server'], Exec['create-ddbb-folder']],
		command => '/bin/echo "smallfiles=true dbpath=/opt/mongodb" >> /etc/mongodb.conf'
	}

	### Install Express through NPM
	exec {'install-express':
		command => "/usr/bin/npm install express",
		require => Package['npm']
	}

	### Download AngularJS
	exec {'download-angularjs':
		require => Package['wget'],
		command => "/usr/bin/wget 'https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js' -O /var/www/mean/public/js/angular.min.js",
		creates => '/var/www/mean/public/js/angular.min.js'
	}
