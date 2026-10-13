#!/usr/bin/env bash
# Exercise 09 · Pipelines
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Sort the names."
sort names.txt

echo "## Task 2: Remove duplicates."
sort -u names.txt

echo "## Task 3: Count each name's occurrences."
sort names.txt | uniq -c

echo "## Task 4: Display the most frequent name using a pipeline."
sort names.txt | uniq -c | sort -nr | awk 'NR==1 {max=$1} $1==max {print $2}'
