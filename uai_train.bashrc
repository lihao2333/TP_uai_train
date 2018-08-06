#!/bin/bash
uai_gen()
{
dir=/data/$1
if [ -f $dir ];then
    echo "same name file exists"
elif [ -d $dir ];then
    echo "same name dir exists"
else
    mkdir $dir
    cd /data/TP_uai_train/
    cp `ls |grep -v elf|grep -v uai_train.bashrc` $dir -r
    sed "1 idirname=$1" -i $dir/configall.sh 
    cd $dir
fi
}

