# Practice p10 · Final challenge: regression report

**Level:** Harder · **Commands:** any of the above
**Where this shows up in DV:** This is a real nightly regression summary: pass rate, failing seeds to rerun, slowest test.

> Each line: test name, seed, result, runtime in seconds.

## Input

```bash
cat > regression.log << EOF
test_reset seed=101 PASS 12
test_burst seed=102 FAIL 45
test_write seed=103 PASS 30
test_read seed=104 PASS 28
test_burst seed=105 FAIL 47
test_reset_async seed=106 PASS 15
test_timeout seed=107 FAIL 120
test_write seed=108 PASS 31
test_read seed=109 FAIL 29
test_burst_wrap seed=110 PASS 52
EOF
```

## Tasks

1. Count the total runs, the passes and the failures (three numbers, one per line).
2. Calculate the pass rate as a percentage.
3. List each failing test name once, with no duplicates.
4. Print the seeds of the failing runs as plain numbers (102, not seed=102).
5. Find the slowest run: print its test name and runtime.
6. Calculate the average runtime.

## How to solve

1. Make a practice folder, paste the **Input** block, and try your commands there:
   `mkdir -p ~/linux_practice/p10 && cd ~/linux_practice/p10`
2. When a command works, put it in [`solution.sh`](solution.sh) in place of its `# TODO: your command` line:
   `vim solution.sh` (from this folder). Keep the `echo` lines and any line marked `# check:`.
3. Check it: `../../run_regression.sh p10`. The expected output is in [`golden.log`](golden.log);
   the diff shows every line that is still different.
4. **PASS**? Commit and push.

No answers here: the only way to PASS is to write the commands yourself.
