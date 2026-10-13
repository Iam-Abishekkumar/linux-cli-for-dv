#!/usr/bin/env bash
# Exercise 10 · Log analysis
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Count total ERROR entries."
grep -c "ERROR" app.log

echo "## Task 2: Show only WARNING lines."
grep "WARNING" app.log

echo "## Task 3: Display the last 3 lines."
tail -n 3 app.log

echo "## Task 4: Display line numbers with ERROR messages."
grep -n "ERROR" app.log

echo "## Task 5: Count total INFO entries."
grep -c "INFO" app.log
