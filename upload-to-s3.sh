#!/bin/bash
hn=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

#for bn in "spot-instance-tf-checkpoint-eu-west-1" "spot-instance-tf-checkpoint-us-east-1" "spot-instance-tf-checkpoint-us-west-1" "spot-instance-tf-checkpoint-us-west-2" "spot-instance-tf-checkpoint-eu-central-1" "spot-instance-tf-checkpoint-ap-ne-1"
for bn in "spot-instance-tf-checkpoint-eu-west-1" "spot-instance-tf-checkpoint-us-west-1" "spot-instance-tf-checkpoint-us-west-2" "spot-instance-tf-checkpoint-eu-central-1" "spot-instance-tf-checkpoint-ap-ne-1"

do
  stime=$(($(date +%s%N)/1000000))
  aws s3 cp /run/shm/6700000-simple-ckpt-model.ckpt-0 s3://"$bn"/ --region eu-west-1
  etime=$(($(date +%s%N)/1000000))
  let "duration = $etime - $stime"
  echo -e "$hn\t$bn\t$duration"
done

