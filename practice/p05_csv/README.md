# Practice p05 · CSV data: cut, sort and uniq

**Level:** Medium · **Commands:** `tail` `cut` `sort` `uniq` `awk`
**Where this shows up in DV:** Regression reports are often CSV: skip the header, pick columns, rank results, count per group.

> The first line is a header, not a student.

## Input

```bash
cat > students.csv << EOF
name,dept,marks
Ravi,ECE,78
Priya,CSE,91
Arun,ECE,85
Divya,EEE,67
Karthik,CSE,91
Meena,ECE,59
Suresh,EEE,73
EOF
```

## Tasks

1. Print the data without the header line.
2. Print only the name and marks columns.
3. Sort the students by marks, highest first, leaving out the header.
4. Count how many students are in each department.
5. Print the name of the topper. If there is a tie, print every topper.

## How to solve

1. Make a practice folder, paste the **Input** block, and try your commands there:
   `mkdir -p ~/linux_practice/p05 && cd ~/linux_practice/p05`
2. When a command works, put it in [`solution.sh`](solution.sh) in place of its `# TODO: your command` line:
   `vim solution.sh` (from this folder). Keep the `echo` lines and any line marked `# check:`.
3. Check it: `../../run_regression.sh p05`. The expected output is in [`golden.log`](golden.log);
   the diff shows every line that is still different.
4. **PASS**? Commit and push.

No answers here: the only way to PASS is to write the commands yourself.
