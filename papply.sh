#!/usr/bin/env bash
_DIR_=$(dirname `readlink -f $0`)
$_DIR_/pcommon.sh $_DIR_/puppet/site.pp "$@"
