#!/usr/bin/env bash
# Exercise 02 · sort + uniq
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Sort the file."
sort fruits.txt

echo "## Task 2: Show unique fruit names."
sort -u fruits.txt

echo "## Task 3: Count occurrences of each fruit."
sort fruits.txt | uniq -c

echo "## Task 4: Show the most repeated fruit."
sort fruits.txt | uniq -c | sort -nr | awk 'NR==1 {max=$1} $1==max'
