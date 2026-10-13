# Exercise 01 · grep + wc

*Search and count lines*

**Where this shows up in DV:** Counting failures in a simulation log: `grep -c "UVM_ERROR" sim.log`

## Input

```bash
cat > students.txt << EOF
John Passed
Mary Failed
Alex Passed
Sarah Passed
David Failed
EOF
```

## Tasks

### 1. Show only students who passed.

```console
$ grep -i "passed" students.txt
John Passed
Alex Passed
Sarah Passed
```

### 2. Show only students who failed.

```console
$ grep -i "failed" students.txt
Mary Failed
David Failed
```

### 3. Count how many students passed.

```console
$ grep -ic "passed" students.txt
3
```

> **Note:** Same result as `grep -i passed students.txt | wc -l`; `-c` lets grep do the counting itself.

### 4. Count the total lines in the file.

```console
$ wc -l < students.txt
5
```

> **Note:** Redirecting with `<` prints only the number. `wc -l students.txt` prints `5 students.txt`.

## Debug notes: what went wrong first

- The first heredoc was typed into `students.tx` (typo) and closed with lowercase `eof`, so the terminal kept waiting for input. The closing word must match exactly: `EOF`.

## Run it

```bash
../../run_regression.sh 01     # setup + solution, compared with golden.log
```
