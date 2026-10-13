#!/usr/bin/env bash
# Exercise 10 · Log analysis
# Stimulus: creates the input for solution.sh in the current directory.

cat > app.log << EOF
INFO Application Started
ERROR Database Failed
INFO User Login
ERROR Connection Lost
WARNING Low Memory
ERROR Timeout
INFO Logout
EOF
