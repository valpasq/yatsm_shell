#!/bin/bash
#$ -l h_rt=24:00:00
#$ -V
#$ -N map_phenology
#$ -j y

if [ -z "$1" ]; then
    echo "Error - please specify a directory with extraced Landsat archives. Usage:"
    echo "    $0 <directory>"
    exit 1
fi

# First input is location of image directory
here=$1
cd $here

# Second input is run name
run=$2

# Third input is date for harmonic extraction, e.g. 2006-06-01
date=$3


# Generate phenology map
yatsm -v map pheno --result ./YATSM_${run} $date ./pheno.gtif

