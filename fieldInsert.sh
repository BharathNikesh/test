#!/bin/bash -x

FILE1="/Users/bgorla/Downloads/graylog/hosts.iad"
FILE2="/Users/bgorla/Downloads/graylog/hosts.iad_new"

#Adds the field IP=<f1> to the field f3

for i in `cat $FILE1|awk '{print $1}' `;do
          cat $FILE1|awk '{print $1}' |while read fname;
          do
              if [[ ${i} == $fname ]];then
                    sed -e "/$fname/s/$/\  IP=$i/g" $FILE1|egrep $fname  >> $FILE2
              fi
         done
done
sort -u $FILE2 > hosts.iad.sorted 
