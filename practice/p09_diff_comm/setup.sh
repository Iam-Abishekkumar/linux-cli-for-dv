#!/usr/bin/env bash
# Practice p09 · Comparing files: diff and comm
# Stimulus: creates the input files in the current directory.

cat > yesterday.txt << EOF
test_burst
test_read
test_reset
test_write
EOF
cat > today.txt << EOF
test_timeout
test_burst
test_write
test_read_wrap
test_reset
EOF
