# Practice p03 · Redirection and tee

**Level:** Easy · **Commands:** `>` `>>` `2>` `tee`
**Where this shows up in DV:** Saving simulator output and errors to separate log files, and watching a run while logging it with tee.

> `missing.txt` does not exist. That is on purpose.

## Input

```bash
cat > notes.txt << EOF
first line
second line
EOF
```

## Tasks

1. Add the line "third line" to the end of notes.txt without losing what is already there.
2. Run `cat notes.txt missing.txt`. Save the normal output in out.txt and the error message in err.txt.
3. Run the same command again, but throw the error message away so only the normal output appears on screen.
4. Save **both** the normal output and the error of that command into one file, all.txt.
5. Show the line count of notes.txt on screen **and** save it in count.txt with the same command.

## How to solve

1. Make a practice folder, paste the **Input** block, and try your commands there:
   `mkdir -p ~/linux_practice/p03 && cd ~/linux_practice/p03`
2. When a command works, put it in [`solution.sh`](solution.sh) in place of its `# TODO: your command` line:
   `vim solution.sh` (from this folder). Keep the `echo` lines and any line marked `# check:`.
3. Check it: `../../run_regression.sh p03`. The expected output is in [`golden.log`](golden.log);
   the diff shows every line that is still different.
4. **PASS**? Commit and push.

No answers here: the only way to PASS is to write the commands yourself.
