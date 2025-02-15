
## Spark

Spark is a data processing framework:

Move to your home directory:

```bash
cd ~
```

Download spark:

```bash
wget https://archive.apache.org/dist/spark/spark-3.5.3/spark-3.5.3-bin-hadoop3.tgz
```

Open the tarball:

```bash
mkdir -p ~/spark && tar -xzf spark-3.5.3-bin-hadoop3.tgz -C ~/spark
```

Set the environment variables needed by spark:

```bash
echo "export SPARK_HOME=$HOME/spark/spark-3.5.3-bin-hadoop3" >> .zshrc
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> .zshrc
```

Let's restart our shell:

```bash
exec zsh
```

Test Spark works by running:

```bash
spark-shell
```

You should see an output similar to:

```bash
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
25/01/15 11:33:07 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Spark context Web UI available at http://de-vm-lrae-test.europe-north1-b.c.wagon-de.internal:4040
Spark context available as 'sc' (master = local[*], app id = local-1736940788403).
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 3.5.3
      /_/

Using Scala version 2.12.18 (OpenJDK 64-Bit Server VM, Java 1.8.0_432)
Type in expressions to have them evaluated.
Type :help for more information.

scala>
```
Type `:quit` and hit enter to exit the spark-shell and continue.
