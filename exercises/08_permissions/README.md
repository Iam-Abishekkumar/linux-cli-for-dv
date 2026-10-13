# Exercise 08 · Permissions

*chmod in symbolic and octal form*

**Where this shows up in DV:** Making run scripts executable (`chmod u+x run_sim.sh`) and keeping golden reference files read-only.

## Input

```bash
touch secret.txt
```

## Tasks

### 1. Give the owner full permissions only.

```console
$ chmod 700 secret.txt
$ stat -c '%A %a %n' secret.txt
-rwx------ 700 secret.txt
```

> **Note:** Octal digits are owner / group / others, each the sum of r=4, w=2, x=1. So 7 = rwx and 0 = nothing.

### 2. Give everyone read permission.

```console
$ chmod a+r secret.txt
$ stat -c '%A %a %n' secret.txt
-rwxr--r-- 744 secret.txt
```

### 3. Remove write permission for group and others.

```console
$ chmod go-w secret.txt
$ stat -c '%A %a %n' secret.txt
-rwxr--r-- 744 secret.txt
```

> **Note:** No visible change here because group and others had no write bit after tasks 1–2. `-w` only removes; it never adds.

### 4. Make the file executable only for the owner.

```console
$ chmod u+x,go-x secret.txt
$ stat -c '%A %a %n' secret.txt
-rwxr--r-- 744 secret.txt
```

> **Note:** `u+x` alone adds execute for the owner but leaves others untouched; `go-x` guarantees “only”.

## Debug notes: what went wrong first

- `stat -c '%A %a %n'` prints the permission string, the octal value and the name. It is used here instead of `ls -l` so the output does not depend on user name or date.

## Run it

```bash
../../run_regression.sh 08     # setup + solution, compared with golden.log
```
