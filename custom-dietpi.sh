#!/usr/bin/env bash

  if [[ $# -ne 3 ]]
  then
    echo "Error: too few or too many parameters."
    echo "Instructions: ./custom-dietpi.sh [printer number] [password] [dietpi.txt template file name]"
    return
  fi
# take printer number as input
#   ? how do we take script params?
# set IP and hostname to match number
#   ? How do we do this with sed?
#     sed 's/find/replace/g' sourcefile > newfile
# Patterns to replace:
SEDIP="AUTO_SETUP_NET_STATIC_IP="
SEDHOST="AUTO_SETUP_NET_HOSTNAME="
SEDPW="AUTO_SETUP_GLOBAL_PASSWORD="

# script input string: [printer number] [password] [basefile]
NUMBER=$1
PW=$2
BASEFILE=$3

# set final IP octet 
IP_START=50
PRINTER_IP=$(($IP_START + $NUMBER))

# Pad number in name with leading 0 if needed
if [[ ${#NUMBER} -lt 2 ]]
then 
  NAME=printer0$NUMBER
else
  NAME=printer$NUMBER
fi


main() {

  sed "s/^\(${SEDIP}\)/${SEDIP}192.168.1.${PRINTER_IP}/g" ${BASEFILE} | 
    sed "s/^\(${SEDHOST}\)/${SEDHOST}${NAME}/g" |
    sed "s/^\(${SEDPW}\)/${SEDPW}${PW}/g" > ${NUMBER}-dietpi.txt 
}
main


