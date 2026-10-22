#!/usr/bin/env bash
# Practice p08 · find: acting on what you find
# Replace each "# TODO: your command" line with your command (one command or one pipeline).
# Check:  ../../run_regression.sh p08        Expected output: golden.log

# Task 1: Find all .c files inside project (sorted).
echo "## Task 1"
# TODO: your command

# Task 2: Find all empty files (sorted).
echo "## Task 2"
# TODO: your command

# Task 3: List only the folders directly inside project: not project itself, nothing deeper (sorted).
echo "## Task 3"
# TODO: your command

# Task 4: Count the total number of lines in all the .c files together.
echo "## Task 4"
# TODO: your command

# Task 5: Delete every .o file with a single find command.
echo "## Task 5"
# TODO: your command
find project -name '*.o' | wc -l   # check: shows the result (keep this line)
