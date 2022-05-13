#!/usr/bin/env bash
# Author: mrueda
dir=vcf
beacon=/pro/beacon/beacon
set -euo pipefail
cd $dir
#rename 's/vcf/.g.vcf/'
for vcf in $(ls -1 *.g.vcf.gz)
do
 filename=$(basename $vcf .g.vcf.gz)     
 echo $filename
 echo "Converting g.vcf to vcf..."
 zcat $vcf  | awk '$5 != "<NON_REF>"' | sed 's#,<NON_REF>##'  | bcftools annotate -x INFO/MLEAC,INFO/MLEAF,FMT/AD,FMT/PL  | gzip > $filename.vcf.gz
 #echo "Running beacon..."
 #nohup $beacon vcf -i $filename.vcf.gz -p ../param.in > $filename.vcf.log
done
