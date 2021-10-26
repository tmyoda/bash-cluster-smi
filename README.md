# bash-cluster-smi
A bash script that displays the usage of each GPU cluster.

## Installation
- Get the submodule
```
git submodule update -i
```

- Make `gpu_hosts.txt`
Enter the hostname delimited by spaces.

```
$ cat gpu_hosts.txt
node7 node8
```


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

