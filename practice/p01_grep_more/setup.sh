#!/usr/bin/env bash
# Practice p01 · grep: beyond the basics
# Stimulus: creates the input files in the current directory.

cat > tests.txt << EOF
test_reset PASS
test_burst FAIL
test_reset_async PASS
test_write PASS
test_read FAIL
test_burst_wrap PASS
test_write_read FAIL
EOF
