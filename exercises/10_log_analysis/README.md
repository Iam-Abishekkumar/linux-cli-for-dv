# Exercise 10 · Log analysis

*The most realistic one*

**Where this shows up in DV:** This is everyday simulation-log triage: swap `ERROR` for `UVM_ERROR` and `app.log` for `sim.log`.

## Input

```bash
cat > app.log << EOF
INFO Application Started
ERROR Database Failed
INFO User Login
ERROR Connection Lost
WARNING Low Memory
ERROR Timeout
INFO Logout
EOF
```

## Tasks

### 1. Count total ERROR entries.

```console
$ grep -c "ERROR" app.log
3
```

> **Note:** Matched case-sensitively on purpose: log severities are uppercase, and `-i` could also hit words like “error” inside a message.

### 2. Show only WARNING lines.

```console
$ grep "WARNING" app.log
WARNING Low Memory
```

### 3. Display the last 3 lines.

```console
$ tail -n 3 app.log
WARNING Low Memory
ERROR Timeout
INFO Logout
```

### 4. Display line numbers with ERROR messages.

```console
$ grep -n "ERROR" app.log
2:ERROR Database Failed
4:ERROR Connection Lost
6:ERROR Timeout
```

### 5. Count total INFO entries.

```console
$ grep -c "INFO" app.log
3
```

## Debug notes: what went wrong first

- The first input file was missing the `ERROR Timeout` line, so the count came out as 2. Check the stimulus before debugging the checker.

## Run it

```bash
../../run_regression.sh 10     # setup + solution, compared with golden.log
```
