# Practice p08 · find: acting on what you find

**Level:** Medium · **Commands:** `find` `wc`
**Where this shows up in DV:** Cleaning a regression area: finding logs and waveform dumps, deleting old build output.

> find lists files in no fixed order, so sort every list.

## Input

```bash
mkdir -p project/src project/docs project/build
echo "int main() { return 0; }" > project/src/main.c
echo "void helper() {}" > project/src/util.c
touch project/src/config.h
echo "Build notes" > project/docs/notes.txt
touch project/build/main.o project/build/util.o
```

## Tasks

1. Find all .c files inside project (sorted).
2. Find all empty files (sorted).
3. List only the folders directly inside project: not project itself, nothing deeper (sorted).
4. Count the total number of lines in all the .c files together.
5. Delete every .o file with a single find command.

## How to solve

1. Make a practice folder, paste the **Input** block, and try your commands there:
   `mkdir -p ~/linux_practice/p08 && cd ~/linux_practice/p08`
2. When a command works, put it in [`solution.sh`](solution.sh) in place of its `# TODO: your command` line:
   `vim solution.sh` (from this folder). Keep the `echo` lines and any line marked `# check:`.
3. Check it: `../../run_regression.sh p08`. The expected output is in [`golden.log`](golden.log);
   the diff shows every line that is still different.
4. **PASS**? Commit and push.

No answers here: the only way to PASS is to write the commands yourself.
