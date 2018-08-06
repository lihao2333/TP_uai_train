'''
演示一个读文件取文件的过程
'''
import tensorflow as tf
import os

# 所有的输入输出路径都依托与这两个变量
DATA_DIR = "/data/data"
OUTPUT_DIR = "/data/output"


directory = OUTPUT_DIR + "/output2"
if not os.path.exists(directory):
    os.makedirs(directory)

with open(DATA_DIR + '/input2/input2.txt', "r") as f_input:
    content = f_input.read()
    print(content)
    with open(OUTPUT_DIR + "/output2/output2.txt", "w") as f_output:
        f_output.write(content)

