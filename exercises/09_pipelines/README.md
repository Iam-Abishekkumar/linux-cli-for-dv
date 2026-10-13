# Exercise 09 · Pipelines

*Chaining commands*

**Where this shows up in DV:** One-line triage: which test or seed fails most often in a regression.

## Input

```bash
cat > names.txt << EOF
John
Alex
John
Mary
Alex
Alex
David
EOF
```

## Tasks

### 1. Sort the names.

```console
$ sort names.txt
Alex
Alex
Alex
David
John
John
Mary
```

### 2. Remove duplicates.

```console
$ sort -u names.txt
Alex
David
John
Mary
```

### 3. Count each name's occurrences.

```console
$ sort names.txt | uniq -c
      3 Alex
      1 David
      2 John
      1 Mary
```

### 4. Display the most frequent name using a pipeline.

```console
$ sort names.txt | uniq -c | sort -nr | awk 'NR==1 {max=$1} $1==max {print $2}'
Alex
```

> **Note:** `sort -nr` puts the highest count first; the awk filter prints only the name(s) with that count.

## Debug notes: what went wrong first

- The first answer, `sort | uniq -c | head -n 1`, printed `alex` only because “alex” sorts first alphabetically. It looked right for the wrong reason; `sort -nr` fixes the logic.
- A trailing space (`john␠` vs `john`) made uniq count the same name twice. Invisible whitespace in input data is a classic source of mismatches.

## Run it

```bash
../../run_regression.sh 09     # setup + solution, compared with golden.log
```
