#!/usr/bin/env bash
# Practice p06 · sed: cleaning up a config file
# Stimulus: creates the input files in the current directory.

printf '%s\n' \
  "# simulation settings" \
  "SEED=1" \
  "VERBOSITY=LOW" \
  "" \
  "TIMEOUT=1000" \
  "# coverage" \
  "COVERAGE=OFF" \
  "" \
  "# end of file" > sim.cfg
