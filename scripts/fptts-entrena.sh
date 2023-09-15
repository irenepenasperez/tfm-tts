#!/bin/bash
bash -v notebooks/fptts-train.sh 2>&1 | tee -a logs/$(date +"%Y%m%d-%H%M%S")-fptts-train.log