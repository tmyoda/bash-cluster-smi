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

### Use this command from the terminal (Optional)

Symbolic link to the system's search path, (e.g. `/usr/local/bin`)

#### Example of adding to `/usr/local/bin`
```
$ ln -s path-to/bash-cluster-smi/gpu_cluster_smi.sh /usr/local/bin/cluster-smi
```
You can use `cluster-smi` from everywhere
```
$ cluster-smi
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

