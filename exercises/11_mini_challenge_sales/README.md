# Exercise 11 · Mini challenge: sales report

*Using only awk, sort, head and pipes*

**Where this shows up in DV:** Turning a regression summary into numbers: pass rate, slowest tests, average runtime.

## Input

```bash
cat > sales.txt << EOF
John 5000
Mary 7000
Alex 3000
Sarah 9000
David 6000
EOF
```

## Tasks

### 1. Find the highest sale.

```console
$ sort -k2,2nr sales.txt | awk 'NR==1 {max=$2} $2==max'
Sarah 9000
```

> **Note:** `-k2,2nr` = sort on column 2 only, numerically, in reverse. The awk filter keeps all ties.

### 2. Find the lowest sale.

```console
$ sort -k2,2n sales.txt | awk 'NR==1 {min=$2} $2==min'
Alex 3000
```

### 3. Calculate total sales.

```console
$ awk '{sum += $2} END {print sum}' sales.txt
30000
```

### 4. Calculate average sales.

```console
$ awk '{sum += $2} END {print sum/NR}' sales.txt
6000
```

> **Note:** Inside `END`, `NR` holds the total number of lines, so the average adapts to any file size.

### 5. Display the top 3 performers.

```console
$ sort -k2,2nr sales.txt | head -n 3
Sarah 9000
Mary 7000
David 6000
```

## Debug notes: what went wrong first

- `sort -n sales.txt` sorted by name: without `-k`, sort compares the whole line from column 1.
- `sort -k2, 2nr` (with a space) gave “invalid number”: the key spec must be one word, `-k2,2nr`.
- `awk '{sum+=%2}'` gave a syntax error: fields are `$2`, not `%2`.
- The first average hard-coded the count (`sum/5`); `sum/NR` works for any number of lines.

## Run it

```bash
../../run_regression.sh 11     # setup + solution, compared with golden.log
```
