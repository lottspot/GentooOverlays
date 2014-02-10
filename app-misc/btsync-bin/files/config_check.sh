#!/bin/bash
DIR_BTSYNC="${HOME}.btsync"
DIR_CONFIG="$DIR_BTSYNC/conf"
DIR_SHARE="$DIR_BTSYNC/share"
DIR_DATA="$DIR_BTSYNC/data"
FILE_CONFIG="btsync.conf"
PATH_CONFIG="$DIR_CONFIG/$FILE_CONFIG"
PATH_TMPL="/usr/share/btsync/btsync.conf"

main(){
    test -f $PATH_CONFIG || newconfig
    exit $?
}

newconfig(){
    test -r $PATH_TMPL || return 2
    builddirs || return $?
    cp $PATH_TMPL $PATH_CONFIG || return 6
    sed -i s:"_USER_HOME":"$HOME":g $PATH_CONFIG || return 7
    return 0
}

builddirs(){
    test -w $DIR_CONFIG || mkdir -p $DIR_CONFIG
    test $? -gt 0 && return 3
    test -w $DIR_SHARE || mkdir -p $DIR_SHARE
    test $? -gt 0 && return 4
    test -w $DIR_DATA || mkdir -p $DIR_DATA
    test $? -gt 0 && return 5
    return 0
}

user=$1
if [[ $(whoami) != $user ]] 
then
  egrep "^$user:" /etc/passwd > /dev/null 2>&1 || exit 1
  su $user -c "$0 $*"
  exit $?
else
  main $*
  exit $?
fi
