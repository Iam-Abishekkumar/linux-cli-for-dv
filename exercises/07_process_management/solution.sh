#!/usr/bin/env bash
# Exercise 07 · Process management
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Find all sleep processes."
pgrep -a sleep | cut -d ' ' -f2-   # PIDs change every run, so compare names only

echo "## Task 2: Count them."
pgrep -c sleep

echo "## Task 3: Kill one process."
P=$(pgrep -f '^sleep 500$'); { kill "$P" && wait "$P"; } 2>/dev/null   # wait reaps the job in a script
pgrep -c sleep

echo "## Task 4: Kill all sleep processes."
{ killall sleep && wait; } 2>/dev/null   # wait reaps the jobs in a script
pgrep -c sleep
