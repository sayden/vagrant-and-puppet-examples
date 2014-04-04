######## YUM Packages ########

# Foundation packages
package { 'gcc': ensure => installed }
package { 'python': ensure => installed }
package { 'git': ensure => installed }

# 3rd party packages
package { 'python-pip':
	ensure => installed,
	require => Package['python']
}

package { 'python-devel':
	ensure => installed,
	require => Package['python']
}

package { 'twisted':
	ensure => installed,
	require => Package['python']
}

package { 'python-twisted-runner':
	ensure => installed,
	require => Package['python']
}

package { 'python-lxml':
	ensure => installed,
	require => Package['python']
}

package { 'python-virtualenv':
	ensure => installed,
	require => Package['python']
}

package {'python-jsonschema':
	ensure => installed,
	require => Package['python']
}

