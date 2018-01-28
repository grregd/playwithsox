#!/bin/bash

#sample arg
# play.sh G/8. A/16 G/8 E/2.

timeBase=4
mode=1

for ((i=1; i<=$#; i++));
do

  arg=${!i}
  argArr=(${arg//\// })
  note=${argArr[0]} # note

  timeDesc=${argArr[1]}
  lengthMod=${timeDesc: -1} # last char

  if [ "$lengthMod" == "." ]; then
    timeMod=1.5
    length=${timeDesc:0: -1} # all but last char
  else
    timeMod=1
    length=${timeDesc}
  fi
  
  echo "note: $note"
  echo "length: $length"
  echo "lengthMod: $lengthMod"

  time=`echo "scale=3; $timeBase / $length * $timeMod" | bc`

  echo "time: $time"
  echo $mode > /sys/class/gpio/gpio1020/value
  play -q -n synth $time pluck $note
#  echo 1 > /sys/class/gpio/gpio1020/value
  echo --------------
  if [ "$mode" = 1 ]; then
    mode=0
  else
    mode=1
  fi 

  echo "mode=$mode"
done

