#!/bin/bash
script_dir=$(dirname "$(readlink -f "$0")")
export PERL5LIB=$script_dir/../lib:$PATH:$PERL5LIB
perl $script_dir/../lib/InterProScan_SDK/InterProScan_SDKServer.pm $1 $2 $3
