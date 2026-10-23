#!/usr/bin/env bash
# Practice p04 · tr and wc: changing characters
# Replace each "# TODO: your command" line with your command (one command or one pipeline).
# Check:  ../../run_regression.sh p04        Expected output: golden.log

# Task 1: Show the whole file in UPPERCASE.
echo "## Task 1"
tr 'a-z' 'A-Z' < message.txt

# Task 2: Squeeze the repeated dots and exclamation marks down to one each.
echo "## Task 2"
tr -s '.!' <message.txt

# Task 3: Show the file with all vowels removed.
echo "## Task 3"
tr -d 'aeiou' < message.txt

# Task 4: Print one word per line.
echo "## Task 4"
tr ' ' '\n' < message.txt 

# Task 5: Count the words in the file, then the characters (print only the two numbers).
echo "## Task 5"
wc -w < message.txt; wc -c < message.txt
