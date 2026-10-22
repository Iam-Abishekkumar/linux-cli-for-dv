#!/usr/bin/env bash
# Practice p06 · sed: cleaning up a config file
# Replace each "# TODO: your command" line with your command (one command or one pipeline).
# Check:  ../../run_regression.sh p06        Expected output: golden.log

# Task 1: Show the file without the comment lines (lines starting with #).
echo "## Task 1"
# TODO: your command

# Task 2: Show only the real settings: no comments and no blank lines, in one command.
echo "## Task 2"
# TODO: your command

# Task 3: Print only lines 2 to 5.
echo "## Task 3"
# TODO: your command

# Task 4: Change SEED to 42 and VERBOSITY to HIGH, saving both changes into the file with one command.
echo "## Task 4"
# TODO: your command
grep -E '^(SEED|VERBOSITY)=' sim.cfg   # check: shows the result (keep this line)

# Task 5: Count how many settings the file has.
echo "## Task 5"
# TODO: your command
