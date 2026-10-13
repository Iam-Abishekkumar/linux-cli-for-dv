#!/usr/bin/env bash
# Exercise 11 · Mini challenge: sales report
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Find the highest sale."
sort -k2,2nr sales.txt | awk 'NR==1 {max=$2} $2==max'

echo "## Task 2: Find the lowest sale."
sort -k2,2n sales.txt | awk 'NR==1 {min=$2} $2==min'

echo "## Task 3: Calculate total sales."
awk '{sum += $2} END {print sum}' sales.txt

echo "## Task 4: Calculate average sales."
awk '{sum += $2} END {print sum/NR}' sales.txt

echo "## Task 5: Display the top 3 performers."
sort -k2,2nr sales.txt | head -n 3
