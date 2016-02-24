#!/usr/bin/env bash
__FILE__=`readlink -f $0`
__DIR__=$(dirname $__FILE__)

PUPPET="/opt/puppetlabs/puppet/bin/puppet"
MODULEPATH="/opt/puppetlabs/puppet/modules:$__DIR__/puppet/modules"
HIERACONFIG="$__DIR__/puppet/hiera.conf"
SITE=`readlink -f $1`
shift
[[ $SITE == *sudo* ]] && SUDO="sudo" || SUDO=""


CMD="$SUDO $PUPPET apply --modulepath=$MODULEPATH --hiera_config=$HIERACONFIG $@ $SITE"
pushd $__DIR__
echo "[PUPPET COMMAND][$(date)]" >> p.out
echo "$CMD" | tee -a p.out
echo "[PUPPET OUT][START][$(date)]" >> p.out
$CMD 2>&1 | tee -a p.out
echo "[PUPPET OUT][END][$(date)]" >> p.out
popd

