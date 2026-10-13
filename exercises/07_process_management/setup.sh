#!/usr/bin/env bash
# Exercise 07 · Process management
# Stimulus: creates the input for solution.sh in the current directory.
# run_regression.sh sources this file in the same shell as solution.sh,
# so the background jobs belong to that shell.

sleep 500 &
sleep 600 &
sleep 700 &

sleep 0.5   # script-only: let the jobs start before solution.sh looks for them
