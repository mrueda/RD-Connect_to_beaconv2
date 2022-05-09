#!/usr/bin/env bash
# Author: mrueda
dir=data/vault/mauricio/ega_downloader/rd_connect_synthetic_data
beacon=/pro/beacon/beacon
set -euo pipefail
for vcf in $dir/EGAF0000557*/*vcf.*z
do
 filename=$(basename $vcf .g.vcf.gz)
 echo "$filename"
 cd vcf
 echo "Converting gvcf to vcf..."
 #zcat $vcf  | awk '$5 != "<NON_REF>"' | sed 's#,<NON_REF>##'  | bcftools annotate -x INFO/MLEAC,INFO/MLEAF,FMT/AD,FMT/PL  | gzip > $filename.vcf.gz
 echo "Running beacon..."
 nohup $beacon vcf -i $filename.vcf.gz -p ../param.in > $filename.log
 cd -
done
