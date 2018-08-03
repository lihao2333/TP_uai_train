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
    find /data/TP_uai_train ! -name ".*" ! -path "*linux64.elf*" ! -path "*.git*" ! -name uai_train.bash -print -exec cp {} $dir -r \;
    sed "1 idirname=$1" -i $dir/configall.sh 
    cd $dir
fi
}

