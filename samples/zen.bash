#!/bin/bash
#
echo ""
echo "Shell Zen"
echo ""
#
count=0
maxcount=10
while [ ${count} -lt ${maxount} ]
do
    echo -n "einatmen "
    sleep 1
    echo -n "."
    sleep 1
    echo -n "."
    sleep 1
    echo -n "."
    sleep 1
    echo -n  "."
    sleep 1
    echo  "."
    sleep 1
#
    echo -n "ausatmen "
    sleep 1
    echo -n "."
    sleep 1
    echo -n "."
    sleep 1
    echo -n "."
    sleep 1
    echo -n  "."
    sleep 1
    echo  "."
    echo ""
#
    count=`expr $count + 1`
done

