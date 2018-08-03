# login to have access to push
sudo docker login uhub.service.ucloud.cn
# build gpu docker
sudo docker build -t uhub.service.ucloud.cn/awlyrics/seq-gan:run -f uaitrain.Dockerfile .
# push gpu docker
sudo docker push uhub.service.ucloud.cn/awlyrics/seq-gan:run
# build cpu docker for local test
sudo docker build -t seq-gan-cpu:run -f uaitrain-cpu.Dockerfile .


