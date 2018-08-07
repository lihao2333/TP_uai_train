#!/bin/bash
source ./configall.sh
filemgr="/data/TP_uai_train/filemgr-linux64.elf/filemgr-linux64"
bucketmgr="/data/TP_uai_train/bucketmgr_linux64.elf/bucketmgr-linux64"
bucket_name="${dirname/_/-}-bucket"
data_dir=/data/$dirname/data
# create config file
echo "{"> ./config.cfg
echo "    \"public_key\" : \"$public_key\",">> ./config.cfg
echo "    \"private_key\" : \"$private_key\",">> ./config.cfg
echo "    \"proxy_host\" : \"${proxy}\",">> ./config.cfg
echo "    \"api_host\" : \"api.spark.ucloud.cn\"">> ./config.cfg
echo "}">> ./config.cfg

# create buckte
${bucketmgr} \
--action CreateBucket \
--bucket ${bucket_name} \
--type private \
--region cn-bj \
--project-id ${project_id}

# upload file
${filemgr}  \
--action mput \
--bucket ${bucket_name} \
--dir ${data_dir}  \
--trimpath /data/  \
--threads 4 
