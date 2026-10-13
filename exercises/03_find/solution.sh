#!/usr/bin/env bash
# Exercise 03 · find
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Find all .txt files."
find ./testdir -name "*.txt" | sort

echo "## Task 2: Find all .log files."
find ./testdir -name "*.log" | sort

echo "## Task 3: Count the total number of files."
find ./testdir -type f | wc -l

echo "## Task 4: Find only directories."
find ./testdir -type d | sort
