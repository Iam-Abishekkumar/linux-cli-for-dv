# Exercise 07 · Process management

*Background jobs, finding and killing processes*

**Where this shows up in DV:** Finding and killing a hung simulation or a stuck regression job.

## Input

```bash
sleep 500 &
sleep 600 &
sleep 700 &
```

> PIDs are different on every run. `solution.sh` prints only process names so the regression stays repeatable.

## Tasks

### 1. Find all sleep processes.

```console
$ pgrep -a sleep
655 sleep 500
656 sleep 600
657 sleep 700
```

> **Note:** `ps -u | grep sleep` also works but lists the grep command itself as a fourth match.

### 2. Count them.

```console
$ pgrep -c sleep
3
```

### 3. Kill one process.

```console
$ kill 655        # PID of 'sleep 500' from task 1
$ pgrep -c sleep
2
```

### 4. Kill all sleep processes.

```console
$ killall sleep
$ pgrep -c sleep
0
```

> **Note:** `pkill sleep` does the same. `kill $(pgrep sleep)` works too.

## Debug notes: what went wrong first

- `ps -u | grep -ic sleep` returned 4 instead of 3: the `grep sleep` process matched itself. `pgrep` avoids that.
- `ps -u | grep sleep | kill` gave a usage error: kill takes PIDs as arguments, it does not read them from a pipe.

## Run it

```bash
../../run_regression.sh 07     # setup + solution, compared with golden.log
```
