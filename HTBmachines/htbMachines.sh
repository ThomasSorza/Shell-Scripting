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
temp="./data/bundle_temp.js"

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
  tput civis
  if [ -f "$bundle" ]; then #Update the machines
    echo -e "\n${greenColor}[*]${endColor} Machines Files Already exist. Checking for updates ..."
    curl -s "$main_link" > "$temp"
    js-beautify "$temp" | sponge "$temp"
    bundlemd5=$(md5sum "$bundle" | awk '{print $1}')
    tempmd5=$( md5sum "$temp" | awk '{print $1}')
    if [ "$bundlemd5" == "$tempmd5" ]; then
      echo -e "\n${greenColor}[*]${endColor} Machine file is Already up to Date.\n\n${greenColor}[*]${endColor} You have the most recents machines uploaded and you are ready to search (use -m to search for a machine)."
      rm $temp
    else
      echo -e "\n${greenColor}[*]${endColor} Updating machines files ..."
      cat "$temp" > "$bundle"
      rm $temp
      echo -e "\n${greenColor}[*]${endColor} Machines file succesfully updated."
    fi
  else #downloading the machines
    echo -e "\n${greenColor}[+]${endColor} Downloading the Machines Files required ...\n"
    curl -s "$main_link" > "$bundle"
    js-beautify "$bundle" | sponge "$bundle"
    echo -e "\n${greenColor}[*]${endColor} All the Machines Files has been downloaded.\n"
  fi
  tput cnorm
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
