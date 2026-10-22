# Practice p01 · grep: beyond the basics

**Level:** Easy · **Commands:** `grep` `cut`
**Where this shows up in DV:** Filtering a regression summary: failed tests only, exact test names, several patterns at once.

## Input

```bash
cat > tests.txt << EOF
test_reset PASS
test_burst FAIL
test_reset_async PASS
test_write PASS
test_read FAIL
test_burst_wrap PASS
test_write_read FAIL
EOF
```

## Tasks

1. Show every line that does **not** contain PASS.
2. Show only the line for `test_reset`, not `test_reset_async`.
3. Show the tests whose name contains `burst` or `read`, using one grep.
4. Count the tests whose name **starts with** `test_write`.
5. Print only the names of the failed tests, without the word FAIL.

## How to solve

1. Make a practice folder, paste the **Input** block, and try your commands there:
   `mkdir -p ~/linux_practice/p01 && cd ~/linux_practice/p01`
2. When a command works, put it in [`solution.sh`](solution.sh) in place of its `# TODO: your command` line:
   `vim solution.sh` (from this folder). Keep the `echo` lines and any line marked `# check:`.
3. Check it: `../../run_regression.sh p01`. The expected output is in [`golden.log`](golden.log);
   the diff shows every line that is still different.
4. **PASS**? Commit and push.

No answers here: the only way to PASS is to write the commands yourself.
