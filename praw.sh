#!/usr/bin/env bash
__FILE__=`readlink -f $0`
__DIR__=$(dirname $__FILE__)

PUPPET="/opt/puppetlabs/puppet/bin/puppet"
MODULEPATH="/opt/puppetlabs/puppet/modules:$__DIR__/puppet/modules"
HIERACONFIG="$__DIR__/puppet/hiera.conf"

CMD="$SUDO $PUPPET apply --modulepath=$MODULEPATH $@ --hiera_config=$HIERACONFIG"
pushd $__DIR__
echo "$CMD" | tee p.cmd
$CMD 2>&1 | tee p.out
popd

