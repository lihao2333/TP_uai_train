#!/bin/bash
source ./configall.sh
echo ${target_image_cpu}
sudo docker run \
-it \
-v /data/${dirname}/data:/data/data \
-v /data/${dirname}/output:/data/output \
uhub.service.ucloud.cn/${registry}/${target_image_cpu} /bin/bash \
-c "cd /data && /usr/bin/python -u ${docker_cmd} \
--work_dir=/data \
--data_dir=/data/data \
--output_dir=/data/output \
--log_dir=/data/output"

