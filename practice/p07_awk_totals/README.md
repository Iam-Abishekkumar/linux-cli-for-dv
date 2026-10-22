# Practice p07 · awk: totals per group

**Level:** Medium · **Commands:** `awk` `sort` `head`
**Where this shows up in DV:** Totals per group from a log: errors per test, runtime per block, coverage per module.

> Columns: order ID, city, amount.

## Input

```bash
cat > orders.txt << EOF
1001 Chennai 2500
1002 Bangalore 1800
1003 Chennai 3200
1004 Mumbai 900
1005 Bangalore 4100
1006 Chennai 1500
1007 Mumbai 2600
EOF
```

## Tasks

1. Print all orders from Chennai.
2. Calculate the total amount of the Chennai orders only.
3. Count how many orders are above 2000.
4. Print the total amount for each city, sorted by city name.
5. Find the city with the highest total.

## How to solve

1. Make a practice folder, paste the **Input** block, and try your commands there:
   `mkdir -p ~/linux_practice/p07 && cd ~/linux_practice/p07`
2. When a command works, put it in [`solution.sh`](solution.sh) in place of its `# TODO: your command` line:
   `vim solution.sh` (from this folder). Keep the `echo` lines and any line marked `# check:`.
3. Check it: `../../run_regression.sh p07`. The expected output is in [`golden.log`](golden.log);
   the diff shows every line that is still different.
4. **PASS**? Commit and push.

No answers here: the only way to PASS is to write the commands yourself.
