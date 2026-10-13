#!/usr/bin/env bash
# Exercise 05 · sed
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Replace Linux with UNIX while displaying output (file unchanged)."
sed 's/Linux/UNIX/g' project.txt

echo "## Task 2: Replace Linux with Ubuntu and save the changes."
sed -i 's/Linux/Ubuntu/g' project.txt
cat project.txt

echo "## Task 3: Print only line 2."
sed -n '2p' project.txt

echo "## Task 4: Delete line 1 while displaying output."
sed '1d' project.txt
