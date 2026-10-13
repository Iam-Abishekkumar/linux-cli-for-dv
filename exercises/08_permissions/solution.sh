#!/usr/bin/env bash
# Exercise 08 · Permissions
# Commands under test. Run after setup.sh in the same directory
# (../../run_regression.sh does both and compares with golden.log).

echo "## Task 1: Give the owner full permissions only."
chmod 700 secret.txt
stat -c '%A %a %n' secret.txt

echo "## Task 2: Give everyone read permission."
chmod a+r secret.txt
stat -c '%A %a %n' secret.txt

echo "## Task 3: Remove write permission for group and others."
chmod go-w secret.txt
stat -c '%A %a %n' secret.txt

echo "## Task 4: Make the file executable only for the owner."
chmod u+x,go-x secret.txt
stat -c '%A %a %n' secret.txt
