#!/bin/bash

#while [ 1 ]; do

for ((i=1;i<=$#;i+=2)) ; do
  tone=${!i}
  j=$((i+1))
  param=${!j}

  d=`echo -e "scale=3\n1/$param" | bc`
  de=`echo -e "scale=3\n$d/30" | bc`
  echo 0 > /sys/class/gpio/gpio1020/value
  play --single-threaded -R -n -c1 -q synth $d pluck $tone
  echo 1 > /sys/class/gpio/gpio1020/value
done

#done

