#!/usr/bin/env bash
# Practice p01 · grep: beyond the basics
# Replace each "# TODO: your command" line with your command (one command or one pipeline).
# Check:  ../../run_regression.sh p01        Expected output: golden.log

# Task 1: Show every line that does not contain PASS.
echo "## Task 1"
grep -i fail tests.txt

# Task 2: Show only the line for test_reset, not test_reset_async.
echo "## Task 2"
grep -iw test_reset tests.txt
# Task 3: Show the tests whose name contains burst or read, using one grep.
echo "## Task 3"
grep -E 'burst|read' tests.txt

# Task 4: Count the tests whose name starts with test_write.
echo "## Task 4"
grep -ic test_write tests.txt
# Task 5: Print only the names of the failed tests, without the word FAIL.
echo "## Task 5"
grep -i fail tests.txt | awk '{print $1}'
