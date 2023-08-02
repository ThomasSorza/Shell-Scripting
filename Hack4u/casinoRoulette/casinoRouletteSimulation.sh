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
  echo -e "\n [*] Playing with $bet to $even_odd\n"
  tput civis #hide the cursor
  profit=0
  plays=0
  bad_plays=""
  while true; do
    plays=$((plays+1))
    money=$(($money-$bet))
#    echo -e "[*] You are betting $bet You have $money"
    if [ $money -ge 0 ]; then
      roulette="$(($RANDOM % 37))"
#      echo -e "[*] Roulette number: $roulette"
      if [ $roulette -eq 0 ]; then
#        echo -e "[*] You get zero, you lose."
        bet=$(($bet*2))

      elif [ $(($roulette % 2)) -eq 0 ]; then #evaluate if is even
#          echo -e "[*] You get an even number"
        if [ "$even_odd" == "even" ]; then #check if the user bet to even
          profit=$((2*$bet))
          money=$(($money+$profit))
#          echo -e "[*] You win $profit and now you have $money"
        elif [ "$even_odd" == "odd" ]; then
#          echo -e "${redColor}[*] You loose, number is not even.${endColor}"
          bet=$(($bet*2))
        fi
      elif [ $(($roulette % 2)) -eq 1 ]; then #evaluate if is odd
#          echo -e "[*] You get an odd number"
        if [ "$even_odd" == "odd" ]; then #check if we user bet to odd
          profit=$((2*$bet))
          money=$(($money+$profit))
#          echo -e "[*] You win you win $profit and now you have $money"
        elif [ "$even_odd" == "even" ]; then
#          echo -e "${redColor}[*] You loose, number is not odd.${endColor}"
          bet=$(($bet*2))
        fi
#        echo -e "[*] You have $money"
      fi
    else
      echo -e "${redColor}[*] You loose, you loose all your money.${endColor}"
      echo -e "${redColor}[*] You played $plays times.${endColor}"
      tput cnorm; exit 0
    fi
    echo -e " ------------------------- \n"
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
