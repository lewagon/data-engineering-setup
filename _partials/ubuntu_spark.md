
## Spark

Spark is a data processing framework:

Move to your home directory:

```bash
cd ~
```

Download spark:

```bash
wget https://downloads.apache.org/spark/spark-3.5.3/spark-3.5.3-bin-hadoop3.tgz
```

Open the tarball:

```
mkdir -p ~/spark && tar -xvzf spark-3.5.3-bin-hadoop3.tgz -C ~/spark
```

Set the environment variables needed by spark:

```bash
echo "export SPARK_HOME=$HOME/spark/spark-3.5.3-bin-hadoop3" >> .zshrc
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> .zshrc
```

Test it works by running:

```bash
exec zsh
spark-shell
```
