#!/bin/bash
source ./configall.sh
sudo python tf_tool.py create \
--public_key="${public_key}" \
--private_key="${private_key}" \
--job_name="${dirname/_/-}-train"  \
--job_memo="$1" \
--node_type="1-P40" \
--code_uhub_path=uhub.service.ucloud.cn/${registry}/${target_image_gpu}  \
--docker_cmd="-u ${docker_cmd}"  \
--max_exec_time=${max_exec_time}  \
--data_ufile_path="http://${bucket_name}.cn-bj.ufileos.com/${dirname}/data/"  \
--output_ufile_path="http://${bucket_name}.cn-bj.ufileos.com/${dirname}/output/"
