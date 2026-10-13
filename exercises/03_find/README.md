# Exercise 03 · find

*Locate files and directories*

**Where this shows up in DV:** Locating every `sim.log`, coverage database or waveform dump under a regression run area.

## Input

```bash
mkdir -p testdir/logs
touch testdir/file1.txt
touch testdir/file2.txt
touch testdir/logs/app.log
touch testdir/logs/error.log
```

## Tasks

### 1. Find all .txt files.

```console
$ find ./testdir -name "*.txt" | sort
./testdir/file1.txt
./testdir/file2.txt
```

> **Note:** `find` lists files in on-disk order, which can differ between machines. `| sort` makes the output repeatable.

### 2. Find all .log files.

```console
$ find ./testdir -name "*.log" | sort
./testdir/logs/app.log
./testdir/logs/error.log
```

### 3. Count the total number of files.

```console
$ find ./testdir -type f | wc -l
4
```

### 4. Find only directories.

```console
$ find ./testdir -type d | sort
./testdir
./testdir/logs
```

## Debug notes: what went wrong first

- `-name "*.logs"` found nothing: the pattern has to match the real extension, `.log`.
- `-name "{.txt, .log}"` found nothing: find does not expand braces. Use `find ./testdir \( -name "*.txt" -o -name "*.log" \)`.
- `find ... | grep -nc ".txt"` counts too, but `| wc -l` is simpler and works for any extension.

## Run it

```bash
../../run_regression.sh 03     # setup + solution, compared with golden.log
```
