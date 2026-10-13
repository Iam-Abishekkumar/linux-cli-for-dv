#!/usr/bin/env bash
# Exercise 04 · cut
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Display only IDs."
cut -d ':' -f1 employees.txt

echo "## Task 2: Display only names."
cut -d ':' -f2 employees.txt

echo "## Task 3: Display only roles."
cut -d ':' -f3 employees.txt
