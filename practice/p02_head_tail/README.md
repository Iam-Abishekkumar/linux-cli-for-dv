# Practice p02 · head and tail: slicing a file

**Level:** Easy · **Commands:** `head` `tail`
**Where this shows up in DV:** Looking at the start of a huge sim.log (build errors) or its end (the final verdict).

## Input

```bash
cat > months.txt << EOF
January
February
March
April
May
June
July
August
September
October
November
December
EOF
```

## Tasks

1. Show the first 4 months.
2. Show the last 3 months.
3. Show only May to August, using **only** head and tail.
4. Show every month except January.
5. Show every month except the last two.

## How to solve

1. Make a practice folder, paste the **Input** block, and try your commands there:
   `mkdir -p ~/linux_practice/p02 && cd ~/linux_practice/p02`
2. When a command works, put it in [`solution.sh`](solution.sh) in place of its `# TODO: your command` line:
   `vim solution.sh` (from this folder). Keep the `echo` lines and any line marked `# check:`.
3. Check it: `../../run_regression.sh p02`. The expected output is in [`golden.log`](golden.log);
   the diff shows every line that is still different.
4. **PASS**? Commit and push.

No answers here: the only way to PASS is to write the commands yourself.
