# Practice p09 · Comparing files: diff and comm

**Level:** Harder · **Commands:** `diff` `comm` `sort` `wc`
**Where this shows up in DV:** Comparing two nights of regression: which failures are new, which were fixed.

> Each file lists the tests that failed in one regression run.

## Input

```bash
cat > yesterday.txt << EOF
test_burst
test_read
test_reset
test_write
EOF
cat > today.txt << EOF
test_timeout
test_burst
test_write
test_read_wrap
test_reset
EOF
```

## Tasks

1. Check whether the two files are identical, printing only a one-line answer.
2. Show the tests that failed on **both** days.
3. Show the **new** failures: failed today but not yesterday.
4. Show the **fixed** tests: failed yesterday but not today.
5. Count the new failures.

## How to solve

1. Make a practice folder, paste the **Input** block, and try your commands there:
   `mkdir -p ~/linux_practice/p09 && cd ~/linux_practice/p09`
2. When a command works, put it in [`solution.sh`](solution.sh) in place of its `# TODO: your command` line:
   `vim solution.sh` (from this folder). Keep the `echo` lines and any line marked `# check:`.
3. Check it: `../../run_regression.sh p09`. The expected output is in [`golden.log`](golden.log);
   the diff shows every line that is still different.
4. **PASS**? Commit and push.

No answers here: the only way to PASS is to write the commands yourself.
