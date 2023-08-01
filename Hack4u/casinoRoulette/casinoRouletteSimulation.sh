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

#global variables

trap ctrl_c INT

function ctrl_c(){
  echo -e "\n\n ${redColor} [!] Exiting ... ${endColor}\n"
exit 1
tput cnorm
}

function helpPanel(){
  echo -e "\n${purpleColor}[*] Usage:${endColor}"
  echo -e "\n\t${turquoiseColor} -m ${endColor}: Enter the amount of money."
  echo -e "\n\t${turquoiseColor} -t ${endColor}: Select the technique that you want to use.\n\t\t ${yellowColor} M = Martingala \n\t\t LI = LabraucherInversa${endColor}"
}

function martingala(){
  echo -e "\n [*] Playing with the Martingala technique.\n"
  echo -ne "\n [*] Enter the amount of the bet -> " && read bet
  echo -ne "\n [*] Enter the bet (even/odd) ->" && read even_odd
  echo -e "\n [*] Playing with $bet to $even_odd"
  tput civis #hide the cursor
  #TODO: get the condition of the while to evaluate the money and the bet
  while true; do
    roulette="$(($RANDOM % 37))"
    echo -e "\n [*] number: $roulette"
  done
  tput cnorm
}

function inverseLabroucher(){
  echo -e "\n Invese la b\n"
}
while getopts "m:t:h" arg; do
  case $arg in
    m) money=$OPTARG;;
    t) technique=$OPTARG;;
    h) ;;
  esac
done

case "$1" in
  *)
    if [ $money ] && [ $technique ]; then
      if [ "$technique" == "M" ]; then
        martingala
      elif [ "$technique" == "IL" ]; then
        inverseLabroucher
      else
        echo -e "\n${redColor} [!] The technique do not exist. ${endColor}"
        helpPanel
      fi
    else
      helpPanel
    fi
    ;;
esac
