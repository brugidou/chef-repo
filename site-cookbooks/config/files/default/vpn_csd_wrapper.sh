#!/bin/bash
# Thanks to http://blog.yunak.eu/2013/07/19/openconnect/

shift

URL=
TICKET=
STUB=
GROUP=
CERTHASH=
LANGSELEN=

echo $@

while [ "$1" ]; do
    if [ "$1" == "-ticket" ];   then shift; TICKET=$1; fi
    if [ "$1" == "-stub" ];     then shift; STUB=$1; fi
    if [ "$1" == "-group" ];    then shift; GROUP=$1; fi
    if [ "$1" == "-certhash" ]; then shift; CERTHASH=$1; fi
    if [ "$1" == "-url" ];      then shift; URL=$1; fi
    if [ "$1" == "-langselen" ];then shift; LANGSELEN=$1; fi
    shift
done

#ARGS="-log debug -ticket $TICKET -stub $STUB -certhash $CERTHASH -group $GROUP -url $URL"
ARGS="-ticket $TICKET -stub $STUB -certhash $CERTHASH -group $GROUP -url $URL"

$HOME/.cisco/hostscan/bin/cstub $ARGS
