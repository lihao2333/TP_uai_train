import tensorflow as tf
import sys
import os
from uaitrain.arch.tensorflow import uflag
FLAGS = tf.app.flags.FLAGS
print(tf.__version__)
print(sys.version_info)
input1 = FLAGS.data_dir + '/input1.txt'
input2 = FLAGS.data_dir + '/input2/input2.txt'
output1 = FLAGS.output_dir + '/output1.txt'
output2 = FLAGS.output_dir + '/output2/output2.txt'
log1 = FLAGS.log_dir + '/log1.txt'
log2 = FLAGS.log_dir + '/log2/log2.txt'
with open(input1, "r") as f_input:
    content = f_input.read()
    print(content)
    with open(output1, "w") as f_output:
        f_output.write(content)
    directory = FLAGS.output_dir + "/output2"
    if not os.path.exists(directory):
        os.makedirs(directory)
    with open(output2, "w") as f_output:
        f_output.write(content)
with open(input2, "r") as f_input:
    content = f_input.read()
    print(content)
    with open(log1, "w") as f_log:
        f_log.write(content)
    directory = FLAGS.log_dir + "/log2"
    if not os.path.exists(directory):
        os.makedirs(directory)
    with open(log2, "w") as f_log:
        f_log.write(content)




