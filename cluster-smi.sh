#!/bin/bash

# Set the hostname here
GPU_NODES=("node7" "node8")

get_node() {
  node=$1
  NVIDIA_SMI=$(ssh ${node} "nvidia-smi" &)
  PS_AUX=$(ssh ${node} "ps -aux" &)
  
  PIDS=$(echo "${NVIDIA_SMI}" | awk 'NR==31, NR==-1 {print $5}')

  if [ "${PIDS}" = "found" ]; then
    RESULT="\t \t \t \n"
  else
    RESULT=$(echo "${NVIDIA_SMI}" | awk 'NR==31, NR==-2 {printf "%s\t%s\t%s\n",$2, $5, $8}')
    MAX_MEM=$(echo "${NVIDIA_SMI}" | awk 'NR==7, NR==22 {print $11}' | awk 'NR%4==0 {print}')
    VOLATILE=$(echo "${NVIDIA_SMI}" | awk 'NR==7, NR==22 {print $13}' | awk 'NR%4==0 {print}')

    for pid in ${PIDS}; do
      user=$(echo "${PS_AUX}" | grep ${pid} | head -n 1 | awk '{print $1}')
      RESULT=$(echo "${RESULT}" | sed -e "s/${pid}/${user}/g")
    done

    # Get the MAX memory
    RESULT=$(echo "${RESULT}" | awk '{printf "%s / %s\n",$0 ,"_"}')
    # One by one
    line=1
    for max_mem in ${MAX_MEM[@]}; do
      RESULT=$(echo "${RESULT}" | sed "${line}s/_/${max_mem}/")
      let line++
    done

    # Get the volatile gpu util
    RESULT=$(echo "${RESULT}" | awk '{printf "%s\t%s\n",$0 ,"_"}')
    # One by one
    line=1
    for volatile in ${VOLATILE[@]}; do
      RESULT=$(echo "${RESULT}" | sed "${line}s/_/${volatile}/")
      let line++
    done

    # Delete the extra line
    RESULT=$(echo "${RESULT}" | sed '$d')
  fi

  # Add the hostname
  RESULT=$(echo "${RESULT}" | awk '{printf "%s\t%s\n"," " ,$0}')
  RESULT=$(echo "${RESULT}" | sed "1s/ /${node}/")

  # Output
  echo -e "NODE\tGPU\tUSER\tGPU Memory Usage\tVolatile GPU-Util\n${RESULT}"
}


for node in ${GPU_NODES[@]}; do
  get_node $node | bash prettytable.sh/prettytable.sh 5 &
  # TODO: Needs improvement
  sleep 0.1
done
wait
