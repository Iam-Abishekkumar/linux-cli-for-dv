# Exercise 05 · sed

*Find-and-replace, print and delete lines*

**Where this shows up in DV:** Patching a define, parameter or path across many testbench and config files at once with `sed -i`.

## Input

```bash
cat > project.txt << EOF
Linux is good
Linux commands are useful
I like Linux
EOF
```

## Tasks

### 1. Replace Linux with UNIX while displaying output (file unchanged).

```console
$ sed 's/Linux/UNIX/g' project.txt
UNIX is good
UNIX commands are useful
I like UNIX
```

> **Note:** `g` replaces every match on a line; without it only the first match per line changes. sed is case-sensitive: `linux` would not match `Linux`.

### 2. Replace Linux with Ubuntu and save the changes.

```console
$ sed -i 's/Linux/Ubuntu/g' project.txt
$ cat project.txt
Ubuntu is good
Ubuntu commands are useful
I like Ubuntu
```

> **Note:** `-i` edits the file in place, so the next tasks see the Ubuntu version.

### 3. Print only line 2.

```console
$ sed -n '2p' project.txt
Ubuntu commands are useful
```

> **Note:** `-n` turns off automatic printing, so only the line selected by `2p` appears. `awk 'NR==2' project.txt` does the same.

### 4. Delete line 1 while displaying output.

```console
$ sed '1d' project.txt
Ubuntu commands are useful
I like Ubuntu
```

## Debug notes: what went wrong first

- `sed '2p'` without `-n` printed every line, with line 2 twice.
- `sed -n '1d'` printed nothing: `-n` stops auto-printing and `d` never prints.
- `sed '2'` gave “missing command”: a line address needs an action such as `p`, `d` or `s`.

## Run it

```bash
../../run_regression.sh 05     # setup + solution, compared with golden.log
```
