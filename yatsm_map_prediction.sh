#!/bin/bash
#$ -l h_rt=72:00:00
#$ -V
#$ -N map_change
#$ -j y

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

# First input is location of image directory
here=$1
cd $here

predictdate=$2
run=$3

# Generate change map
yatsm -v map --result ./${run}_YATSM/ predict $predictdate ${predictdate}_prediction_${run}.gtif

