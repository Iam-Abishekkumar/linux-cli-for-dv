#!/usr/bin/env bash
# Exercise 01 · grep + wc
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Show only students who passed."
grep -i "passed" students.txt

echo "## Task 2: Show only students who failed."
grep -i "failed" students.txt

echo "## Task 3: Count how many students passed."
grep -ic "passed" students.txt

echo "## Task 4: Count the total lines in the file."
wc -l < students.txt
