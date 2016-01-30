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

run=$2

startdate=1982-01-01
enddate=2015-12-31

# Generate change map
yatsm -v changemap --result ./YATSM_${run}/ first $startdate $enddate ./${run}_changemap_first.gtif

yatsm -v changemap --result ./YATSM_${run}/ last $startdate $enddate ./${run}_changemap_last.gtif

yatsm -v changemap --result ./YATSM_${run}/ num $startdate $enddate ./${run}_changemap_num.gtif