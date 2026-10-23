#!/usr/bin/env bash
# Practice p02 · head and tail: slicing a file
# Replace each "# TODO: your command" line with your command (one command or one pipeline).
# Check:  ../../run_regression.sh p02        Expected output: golden.log

# Task 1: Show the first 4 months.
echo "## Task 1"
head -n 4 months.txt

# Task 2: Show the last 3 months.
echo "## Task 2"
tail -n 3 months.txt

# Task 3: Show only May to August, using only head and tail.
echo "## Task 3"
head -n 8 months.txt | tail -n 4

# Task 4: Show every month except January.
echo "## Task 4"
tail -n +2 months.tx

# Task 5: Show every month except the last two.
echo "## Task 5"
head -n -2 months.txt
