#!/bin/bash
source ./configall.sh
edit_image_cmd=edit_image_cmd.txt #在这个文件里面写需要添加的命令,格式为RUN [cmd] *
middle_image_cpu_file=build_middle_image_cpu.Dockerfile
middle_image_gpu_file=build_middle_image_gpu.Dockerfile

target_image_cpu_file=build_middle_image_cpu.Dockerfile
target_image_gpu_file=build_middle_image_gpu.Dockerfile

middle_image_cpu=${dirname/_/-}_cpu:middle # 中间cpu镜像命名
middle_image_gpu=${dirname/_/-}_gpu:middle # 中间gpu镜像命名



# docker login to have access to push images
echo "登录docker,请输入你登录ucloud的用户名和密码"
sudo docker login uhub.service.ucloud.cn


# build middle image and upload
echo "From $base_image_cpu">${middle_image_cpu_file}
echo "From $base_image_gpu">${middle_image_gpu_file}
cat ${edit_image_cmd}>>build_middle_image_cpu.Dockerfile
cat ${edit_image_cmd}>>build_middle_image_gpu.Dockerfile
sudo docker build -t uhub.service.ucloud.cn/${registry}/${middle_image_cpu}  -f ${middle_image_cpu_file} .
sudo docker build -t uhub.service.ucloud.cn/${registry}/${middle_image_gpu}  -f ${middle_image_gpu_file} .
sudo docker push uhub.service.ucloud.cn/${registry}/${middle_image_cpu}
sudo docker push uhub.service.ucloud.cn/${registry}/${middle_image_gpu}

# build target image
code_path=./code
echo "From uhub.service.ucloud.cn/${registry}/${middle_image_cpu}">${target_image_cpu_file}
echo "From uhub.service.ucloud.cn/${registry}/${middle_image_gpu}">${target_image_gpu_file}
echo "add ${code_path} /data">>${target_image_cpu_file}
echo "add ${code_path} /data">>${target_image_gpu_file}
sudo docker build -t uhub.service.ucloud.cn/${registry}/${target_image_cpu}  -f ${target_image_cpu_file} .
sudo docker build -t uhub.service.ucloud.cn/${registry}/${target_image_gpu}  -f ${target_image_gpu_file} .
sudo docker push uhub.service.ucloud.cn/${registry}/${target_image_cpu}
sudo docker push uhub.service.ucloud.cn/${registry}/${target_image_gpu}
