#!/bin/bash
source ./configall.sh
echo ${target_image_cpu}
sudo docker run \
-it \
-v /data/${dirname}/data:/data/data \
-v /data/${dirname}/output:/data/output \
-w /data \
uhub.service.ucloud.cn/${registry}/${target_image_cpu} /bin/bash 
