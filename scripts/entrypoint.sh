#!/bin/bash

. /kb/deployment/user-env.sh

python ./scripts/prepare_deploy_cfg.py ./deploy.cfg ./work/config.properties

if [ $# -eq 0 ] ; then
  sh ./scripts/start_server.sh
elif [ "${1}" = "test" ] ; then
  echo "Run Tests"
  make test
elif [ "${1}" = "async" ] ; then
  sh ./scripts/run_async.sh
elif [ "${1}" = "init" ] ; then
  echo "Initialize module"
  cd /data
  wget -nv ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.18-57.0/interproscan-5.18-57.0-64-bit.tar.gz|tar xzf -
  echo 'export INTERPROSCAN_INSTALL=/data/interproscan' >> /kb/deployment/user-env.sh
  echo 'export PATH=$PATH:$INTERPROSCAN_INSTALL' >> /kb/deployment/user-env.sh
  if [ -d interproscan-5.18-57.0 ] ; then
  	mv interproscan-5.18-57.0 /data/interproscan
  	touch __READY__
  fi
elif [ "${1}" = "bash" ] ; then
  bash
elif [ "${1}" = "report" ] ; then
  export KB_SDK_COMPILE_REPORT_FILE=./work/compile_report.json
  make compile
else
  echo Unknown
fi