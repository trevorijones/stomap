#puppet cron set up
class puppet inherits puppet::params {
        cron { 'run-papply':
            ensure  => present,
            user    => "${params::user}",
            command => "cd /home/${params::user}/automation && svn up && ./papply.sh",
            minute  => '*/10',
            hour    => '*',
        }
}
