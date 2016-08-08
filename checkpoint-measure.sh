#!/bin/bash

hn=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
for i in {1..100}
  do
  for var in 50000 100000 200000 410000 820000 1640000 3280000 6700000 13400000 26800000 53600000
  do
    duration=$(python hidden.py --train simdata/moon_data_train.csv --test simdata/moon_data_eval.csv --num_epochs 1 --num_hidden $var --verbose | grep 'second per checkpoint:' | awk '{print $4}')
    echo -e "$hn\t$var\t$duration" 
  done
done
