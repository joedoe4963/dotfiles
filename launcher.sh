#!/bin/bash 

GREEN='\033[0;32m'
NOCOLOR='\033[0m'
RED='\033[0;31m'
FILE=links
if [ $# -eq 0 ]
  then
  echo -e " 
█    ██     ▄      ▄   ▄█▄     ▄  █ ▄███▄   █▄▄▄▄ 
█    █ █     █      █  █▀ ▀▄  █   █ █▀   ▀  █  ▄▀ 
█    █▄▄█ █   █ ██   █ █   ▀  ██▀▀█ ██▄▄    █▀▀▌  
███▄ █  █ █   █ █ █  █ █▄  ▄▀ █   █ █▄   ▄▀ █  █  
    ▀   █ █▄ ▄█ █  █ █ ▀███▀     █  ▀███▀     █   
           █   ▀▀▀  █   ██          ▀            ▀    
                 ▀                                           
by ${GREEN}a.louhichi@autobiz.com${GREEN}\n"
 echo -e "@USAGE:" 
 echo -e "${GREEN}-h${NOCOLOR} show help" 
 echo -e "${GREEN}-q${NOCOLOR} execute script and exit"
 echo -e "${GREEN}-v${NOCOLOR} show script version" 
fi

while [ -n "$1" ] 
do 
  case "$1" in 
  -h) echo "help section goes here" ;; 
      
  -q)
    echo -e "starting ${GREEN}firefox${GREEN} and restore session" 
    
    while read LINE; do
        firefox --new-tab $LINE  
    done < $FILE
     
    echo -e "starting ${GREEN} PHPStorm ${GREEN}"; 

    nohup phpstorm "$@" > /dev/null 2>&1 & disown;
    
    echo -e "starting ${GREEN}Teams${GREEN} and restore session"; 

    nohup teams-insiders "$@" > /dev/null 2>&1 & disown;;

    *) echo "This is invalid option";; 
  esac 
  shift 
done 

