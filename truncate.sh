#!/bin/bash -x
#this is a test
LOG_DIR="/root/PBSpectrum/server/app/repository/logs"
cd $LOG_DIR

#truncating all the log files
for logs in `ls *.log`;do
    /usr/bin/truncate -s 0 ${logs}
done
