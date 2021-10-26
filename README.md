# bash-cluster-smi
A bash script that displays the usage of each GPU cluster.


## Usage
Just RUN `bash cluster-smi.sh`
```
$ bash cluster-smi.sh
+-------+-----+------+--------------------+-------------------+
|NODE   |GPU  |USER  |GPU Memory Usage    |Volatile GPU Util  |
+-------+-----+------+--------------------+-------------------+
|node7  |1    |oda   |1103MiB / 11019MiB  |0%                 |
|       |2    |oda   |1103MiB / 11019MiB  |0%                 |
|       |3    |oda   |1103MiB / 11019MiB  |0%                 |
+-------+-----+------+--------------------+-------------------+
+-------+-----+------+------------------+-------------------+
|NODE   |GPU  |USER  |GPU Memory Usage  |Volatile GPU Util  |
+-------+-----+------+------------------+-------------------+
|node8  |     |      |                  |                   |
+-------+-----+------+------------------+-------------------+
```

