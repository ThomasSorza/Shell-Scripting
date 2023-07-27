#!/bin/bash

#Colors
greenColor="\e[0;32m\033[1m"
endColor="\033[0m\e[0m"
redColor="\e[0;31m\033[1m"
blueColor="\e[0;34m\033[1m"
yellowColor="\e[0;33m\033[1m"
purpleColor="\e[0;35m\033[1m"
turquoiseColor="\e[0;36m\033[1m"
grayColor="\e[0;37m\033[1m"

function ctrl_c(){
  echo -e "\n\n ${redColor} [!] Exiting...${endColor}\n"
  exit 1
}

#Ctrl_c
trap ctrl_c INT

function helpPanel(){
  echo -e "\n\n ${grayColor} [*] panel help ${endColor}\n"
}

function searchMachine(){
  echo "searching $1"
}

#Indicator
declare -i parameter_counter=0

while getopts "m:h" arg; do
  case $arg in
    m) machine_name=$OPTARG; let parameter_counter+=1;;
    h) helpPanel;;
  esac
done

if [ $parameter_counter -eq 1 ]; then
  searchMachine $machine_name
else
  helpPanel
fi
