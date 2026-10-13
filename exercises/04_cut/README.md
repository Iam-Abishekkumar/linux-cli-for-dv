# Exercise 04 · cut

*Extract columns*

**Where this shows up in DV:** Pulling one column (test name, seed, status) out of a delimited regression report.

## Input

```bash
cat > employees.txt << EOF
101:John:Developer
102:Mary:Tester
103:Alex:DevOps
EOF
```

## Tasks

### 1. Display only IDs.

```console
$ cut -d ':' -f1 employees.txt
101
102
103
```

### 2. Display only names.

```console
$ cut -d ':' -f2 employees.txt
John
Mary
Alex
```

### 3. Display only roles.

```console
$ cut -d ':' -f3 employees.txt
Developer
Tester
DevOps
```

> **Note:** `-d ':'` sets the delimiter; `-f3` selects field 3.

## Debug notes: what went wrong first

- `cut-d ':' -f1` gave “command not found”: a space is needed between the command and its options.

## Run it

```bash
../../run_regression.sh 04     # setup + solution, compared with golden.log
```
