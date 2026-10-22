#!/usr/bin/env bash
# Practice p03 · Redirection and tee
# Replace each "# TODO: your command" line with your command (one command or one pipeline).
# Check:  ../../run_regression.sh p03        Expected output: golden.log

# Task 1: Add the line "third line" to the end of notes.txt without losing what is already there.
echo "## Task 1"
# TODO: your command
cat notes.txt   # check: shows the result (keep this line)

# Task 2: Run cat notes.txt missing.txt. Save the normal output in out.txt and the error message in err.txt.
echo "## Task 2"
# TODO: your command
echo "--- out.txt"; cat out.txt; echo "--- err.txt"; cat err.txt   # check: shows the result (keep this line)

# Task 3: Run the same command again, but throw the error message away so only the normal output appears on screen.
echo "## Task 3"
# TODO: your command

# Task 4: Save both the normal output and the error of that command into one file, all.txt.
echo "## Task 4"
# TODO: your command
echo "--- all.txt"; cat all.txt   # check: shows the result (keep this line)

# Task 5: Show the line count of notes.txt on screen and save it in count.txt with the same command.
echo "## Task 5"
# TODO: your command
echo "--- count.txt"; cat count.txt   # check: shows the result (keep this line)
