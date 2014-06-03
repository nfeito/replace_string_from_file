#!/bin/sh

check_status() {
    if [ ! ${status_cmd} ]; then
        echo "Problem with removing the string"
        exit 1
    fi
}

if [ "$#" -ne "2" ]; then
    echo "Usage: $0 <string> <file>"
    exit 1
fi

if [ ! -w "$2" ]; then
    echo "$2 is not writable"
    exit 1
fi

##### Main #####
status_cmd=`mv ${2} /tmp/${2}`
check_status ${status_cmd}

status_cmd=`sed s/${1}// $2`
check_status ${status_cmd}
