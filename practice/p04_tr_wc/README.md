# Practice p04 · tr and wc: changing characters

**Level:** Easy · **Commands:** `tr` `wc`
**Where this shows up in DV:** Normalising text before comparing logs: case, repeated characters, one token per line.

## Input

```bash
cat > message.txt << EOF
linux is fun.....
practice every day
the terminal is your friend!!!
EOF
```

## Tasks

1. Show the whole file in UPPERCASE.
2. Squeeze the repeated dots and exclamation marks down to one each.
3. Show the file with all vowels removed.
4. Print one word per line.
5. Count the words in the file, then the characters (print only the two numbers).

## How to solve

1. Make a practice folder, paste the **Input** block, and try your commands there:
   `mkdir -p ~/linux_practice/p04 && cd ~/linux_practice/p04`
2. When a command works, put it in [`solution.sh`](solution.sh) in place of its `# TODO: your command` line:
   `vim solution.sh` (from this folder). Keep the `echo` lines and any line marked `# check:`.
3. Check it: `../../run_regression.sh p04`. The expected output is in [`golden.log`](golden.log);
   the diff shows every line that is still different.
4. **PASS**? Commit and push.

No answers here: the only way to PASS is to write the commands yourself.
