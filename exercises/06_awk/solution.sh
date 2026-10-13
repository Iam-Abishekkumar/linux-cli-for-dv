#!/usr/bin/env bash
# Exercise 06 · awk
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Display only names."
awk '{print $1}' marks.txt

echo "## Task 2: Display only marks."
awk '{print $2}' marks.txt

echo "## Task 3: Show students scoring above 80."
awk '$2 > 80 {print $1}' marks.txt

echo "## Task 4: Calculate total marks."
awk '{sum += $2} END {print sum}' marks.txt
