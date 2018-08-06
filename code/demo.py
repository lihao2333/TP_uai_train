'''
演示一个读文件取文件的过程
'''
import tensorflow as tf
import sys
import os
print(tf.__version__)
print(sys.version_info)
DATA_DIR = "/data/data"
OUTPUT_DIR = "/data/output"
input2 = DATA_DIR + '/input2/input2.txt'
output2 = OUTPUT_DIR + '/output2/output2.txt'
log2 = OUTPUT_DIR + '/log2/log2.txt'
with open(input2, "r") as f_input:
    content = f_input.read()
    print(content)
    directory = OUTPUT_DIR + "/output2"
    if not os.path.exists(directory):
        os.makedirs(directory)
    with open(output2, "w") as f_output:
        f_output.write(content)




