# puppet/modules/lfhs/init.pp
# Local file hierarchy standard
class lfhs (
        $root = "${::userhome}/root",
        $directories = ['data', 'etc', 'opt', 'bin', 'src', 'var', 'var/log'],
        ) {
        file { "${root}":
            ensure => directory,
        }
        $directories.each |String $local_part| {
# dir creation should create parents directories as needed?
# maybe an option to toggle on parent directories creation.
# This make clear that parent directories can be created fine tuned. 
# Ok, there is no obvious equivalent to mkdir -p.
# For the moment the directories list must be aware of that.
            file { "${root}/${local_part}":
                ensure  => directory,
                require => File["${root}"],
# mode could be specified with the directory name
                mode    => '0664',
            }
        }
}
