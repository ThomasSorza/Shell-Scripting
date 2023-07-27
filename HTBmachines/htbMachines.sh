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

#Global Variables
main_link="https://htbmachines.github.io/bundle.js"
bundle="./data/bundle.js"

function ctrl_c(){
  echo -e "\n\n ${redColor} [!] Exiting...${endColor}\n"
  tput cnorm && exit 1
}

#Ctrl_c
trap ctrl_c INT

function helpPanel(){
  echo -e "\n ${yellowColor} [*]${endColor} ${grayColor} Usage: ${endColor}\n"
  echo -e "\t ${turquoiseColor} -m: ${endColor} ${purpleColor}[machine name]${purpleColor} ${grayColor} Search by machine name. ${endColor}\n"
  echo -e "\t ${turquoiseColor} -h: ${endColor} ${grayColor}Display this help panel.${endColor}\n"
  echo -e "\t ${turquoiseColor} -u: ${endColor} ${grayColor}Update the Machine File.${endColor}\n"
  echo -e "\t ${turquoiseColor} -o: ${endColor} ${purpleColor}[operating_system]${endColour} ${grayColor} Search machines by operating system ${endColor}\n"
}

function searchMachine(){
  echo "searching $1"
}

function updateMachineFile(){
  if [ -f "$bunble" ]; then
    echo -e "\n${greenColor}[*]${endColor} Machines File Already exist."
    #if [ isdiff ]; then
     # echo -e "Machine file is Already up to Date.\nYou have the most recents machines uploaded to search."
     # rm file
    #else
     # echo "[*] Machines file succesfully updated."
    #fi
  else #downloading the machine
    tput civis
    echo -e "\n${greenColor}[+]${endColor} Downloading the Machines files required ...\n"
    curl -s "$main_link" > "$bundle"
    js-beautify "$bundle" | sponge "$bundle"
    echo -e "\n${greenColor}[*]${endColor} All the Machine File has been downloaded.\n"

fi
}

#function searchByOs(){
  #TODO: Search by OS
#}

#Indicator
declare -i parameter_counter=0

#TODO add -o option for OS
while getopts "m:hu" arg; do
  case $arg in
    m) machine_name=$OPTARG; let parameter_counter+=1;;
    h) ;;
    u) parameter_counter+=2;;
    #0) searchByOS;;
  esac
done

if [ $parameter_counter -eq 1 ]; then
  searchMachine $machine_name
elif [ $parameter_counter -eq 2 ]; then
  updateMachineFile
else
  helpPanel
fi
