# Exercise 06 · awk

*Fields, conditions and totals*

**Where this shows up in DV:** Summing or averaging numbers from logs: simulation time, coverage %, errors per test.

## Input

```bash
cat > marks.txt << EOF
John 85
Mary 92
Alex 70
Sarah 95
EOF
```

## Tasks

### 1. Display only names.

```console
$ awk '{print $1}' marks.txt
John
Mary
Alex
Sarah
```

### 2. Display only marks.

```console
$ awk '{print $2}' marks.txt
85
92
70
95
```

### 3. Show students scoring above 80.

```console
$ awk '$2 > 80 {print $1}' marks.txt
John
Mary
Sarah
```

### 4. Calculate total marks.

```console
$ awk '{sum += $2} END {print sum}' marks.txt
342
```

> **Note:** The main block runs once per line; `END` runs once after the last line, so the total prints only once.

## Debug notes: what went wrong first

- `awk 'marks=$1+$2+$3+$4 ...'` added fields *across* one row instead of down the marks column.
- `awk '{sum += $2; print sum}'` printed a running total (85, 177, 247, 342). Moving the print into `END` gives just the total.
- A stray `E` in `{sum += $2 E}` happened to work because E is an empty variable; removed.

## Run it

```bash
../../run_regression.sh 06     # setup + solution, compared with golden.log
```
