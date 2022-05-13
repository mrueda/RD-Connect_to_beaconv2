#!/usr/bin/env bash
# Author: mrueda
beacon=/pro/beacon/beacon
#cd vcf
parallel "$beacon vcf -n 1 -i {}.vcf.gz  -p ../param.in > {}.vcf.log 2>&1" :::  `ls -1 *[0-9].vcf.gz | cut -d'.' -f1`
