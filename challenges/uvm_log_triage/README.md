# Challenge · UVM log triage (unsolved)

The same commands from the exercises, pointed at a real-shaped problem: a UVM simulation log from an AXI burst test.
[`sim.log`](sim.log) is the input. There are no solutions here yet; this is the next one to solve.

## Tasks

1. Count the `UVM_ERROR` **messages** in the log.
2. List every error ID (the text in `[brackets]` on `UVM_ERROR` lines) with its count, most frequent first.
3. Print the simulation time (the number after `@`) of the **first** `UVM_ERROR`.
4. Print the test name from the `Running test` line.
5. Print `TEST PASSED` if there are zero `UVM_ERROR` and `UVM_FATAL` messages, otherwise `TEST FAILED`, in one command.
6. Check the log against itself: does your count from task 1 match the `UVM_ERROR :` number in the report summary?

> **Trap:** the report summary at the end also contains the word `UVM_ERROR`. A plain `grep -c "UVM_ERROR"` is wrong here.

## When it is solved

Move it into the regression:

```bash
git mv challenges/uvm_log_triage exercises/12_uvm_log_triage
cd exercises/12_uvm_log_triage
printf '#!/usr/bin/env bash\ncp "$EX_DIR/sim.log" .\n' > setup.sh
# write solution.sh (echo a "## Task N" header before each answer), then:
../../run_regression.sh --update 12 && git diff     # review the new golden.log
```
