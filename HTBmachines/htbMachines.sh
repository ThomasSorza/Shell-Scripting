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
color_code="\033[0;31m"   # Red color code
reset_code="\033[0m"      # Reset color code

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
  echo -e "\t ${turquoiseColor} -o: ${endColor} ${purpleColor}[operating_system]${endColour} ${grayColor} Search machines by operating system. ${endColor}\n"
  echo -e "\t ${turquoiseColor} -i: ${endColor} ${purpleColor}[ip_address]${endColour} ${grayColor} Search machines by IP address. ${endColor}\n"
}

function updateMachineFile(){
  tput civis
  echo -e "\n${yellowColor}[*]${endColor} ${grayColor} Cheking for Machines Updates... ${endColor}"
  sleep 1.2
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
      rm $bundle && mv "$temp" "$bundle"
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

function searchMachine(){
  machine_name="$1"
  if grep -q "$machine_name" $bundle; then #check if machine exist
    echo -e "\n${greenColor}[!] Listing $machine_name's Machine Properties:${endColor}\n"
    cat $bundle | awk "/name: \"$machine_name\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta:" | tr -d '"' | tr -d ',' | sed 's/^ *//' | sed 's/:/ -> /' | awk -v color="$color_code" -v reset="$reset_code" '{printf color "%s" reset, $1; for (i=2; i<=NF; i++) printf " %s", $i; print ""}'
  else
    echo -e "\n${redColor}[!] ERROR:${endColor} Machine named $machine_name do not exist or is not found.\n"
  fi
}

function searchByIp(){
  ip=$1
  if grep -q "$ip" $bundle; then
    machineName=$(grep -B 3 "\"$ip\"" $bundle | grep "name:" | awk NF'{print $NF}' | tr -d '"|,')
    searchMachine $machineName
  else
    echo -e "\n${redColor}[!] ERROR:${endColor} IP address $ip do not exist or is not found.\n"
  fi
}

#function searchByOs(){
  #TODO: Search by OS
#}

#Indicator
declare -i parameter_counter=0

#TODO add -o option for OS
while getopts "m:hi:u" arg; do
  case $arg in
    m) machine_name=$OPTARG; let parameter_counter+=1;;
    h) ;;
    i) ipAdd=$OPTARG; let parameter_counter+=3;;
    u) parameter_counter+=2;;
    #0) searchByOS;;
  esac
done

case $parameter_counter in
  1)
    searchMachine "$machine_name"
    ;;
  2)
    updateMachineFile
    ;;
  3)
    searchByIp "$ipAdd"
    ;;
  *)
    helpPanel
    ;;
esac
