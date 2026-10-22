# Practice p06 · sed: cleaning up a config file

**Level:** Medium · **Commands:** `sed` `grep` `wc`
**Where this shows up in DV:** Editing simulation config and testbench files from the command line: seeds, verbosity, defines.

> printf writes each quoted string on its own line, so each `""` makes a blank line.

## Input

```bash
printf '%s\n' \
  "# simulation settings" \
  "SEED=1" \
  "VERBOSITY=LOW" \
  "" \
  "TIMEOUT=1000" \
  "# coverage" \
  "COVERAGE=OFF" \
  "" \
  "# end of file" > sim.cfg
```

## Tasks

1. Show the file without the comment lines (lines starting with #).
2. Show only the real settings: no comments and no blank lines, in one command.
3. Print only lines 2 to 5.
4. Change SEED to 42 and VERBOSITY to HIGH, saving both changes into the file with one command.
5. Count how many settings the file has.

## How to solve

1. Make a practice folder, paste the **Input** block, and try your commands there:
   `mkdir -p ~/linux_practice/p06 && cd ~/linux_practice/p06`
2. When a command works, put it in [`solution.sh`](solution.sh) in place of its `# TODO: your command` line:
   `vim solution.sh` (from this folder). Keep the `echo` lines and any line marked `# check:`.
3. Check it: `../../run_regression.sh p06`. The expected output is in [`golden.log`](golden.log);
   the diff shows every line that is still different.
4. **PASS**? Commit and push.

No answers here: the only way to PASS is to write the commands yourself.
