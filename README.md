# Linux CLI for Design Verification

[![regression](https://github.com/Iam-Abishekkumar/linux-cli-for-dv/actions/workflows/regression.yml/badge.svg)](https://github.com/Iam-Abishekkumar/linux-cli-for-dv/actions/workflows/regression.yml)

10 hands-on Linux exercises plus a mini challenge (45 tasks) on `grep`, `sort`, `uniq`, `find`, `cut`, `sed`, `awk`, processes and permissions,
solved and **checked the way a verification team checks RTL**: every solution is re-run on each push and compared against a golden output.

Day-to-day DV work is mostly reading text: triaging thousands of lines of simulation output, finding which seed failed,
counting `UVM_ERROR`s across a regression. These are the commands that do that job.

## How this repo is verified

```text
 setup.sh ──► solution.sh ──► actual output ──┐
 (stimulus)   (DUT)                           ├──► diff ──► PASS / FAIL
                         golden.log ──────────┘
                         (reference)
```

| In this repo | DV equivalent |
|---|---|
| `setup.sh` | Stimulus: creates the input files |
| `solution.sh` | Design under test: the commands being checked |
| `golden.log` | Reference model: the expected output |
| `run_regression.sh` | Regression runner and scoreboard |
| GitHub Actions | CI regression on every push (badge above) |

## Exercises

| # | Exercise | Commands | Where it shows up in DV |
|---|---|---|---|
| 01 | [grep + wc](exercises/01_grep_wc/) | `grep` `wc` | Counting failures in a simulation log: `grep -c "UVM_ERROR" sim.log` |
| 02 | [sort + uniq](exercises/02_sort_uniq/) | `sort` `uniq` `awk` | Ranking which error IDs or failing tests appear most often across a regression. |
| 03 | [find](exercises/03_find/) | `find` `wc` `sort` | Locating every `sim.log`, coverage database or waveform dump under a regression run area. |
| 04 | [cut](exercises/04_cut/) | `cut` | Pulling one column (test name, seed, status) out of a delimited regression report. |
| 05 | [sed](exercises/05_sed/) | `sed` `cat` | Patching a define, parameter or path across many testbench and config files at once with `sed -i`. |
| 06 | [awk](exercises/06_awk/) | `awk` | Summing or averaging numbers from logs: simulation time, coverage %, errors per test. |
| 07 | [Process management](exercises/07_process_management/) | `pgrep` `kill` `killall` | Finding and killing a hung simulation or a stuck regression job. |
| 08 | [Permissions](exercises/08_permissions/) | `chmod` `stat` | Making run scripts executable (`chmod u+x run_sim.sh`) and keeping golden reference files read-only. |
| 09 | [Pipelines](exercises/09_pipelines/) | `sort` `uniq` `awk` | One-line triage: which test or seed fails most often in a regression. |
| 10 | [Log analysis](exercises/10_log_analysis/) | `grep` `tail` | This is everyday simulation-log triage: swap `ERROR` for `UVM_ERROR` and `app.log` for `sim.log`. |
| 11 | [Mini challenge: sales report](exercises/11_mini_challenge_sales/) | `sort` `awk` `head` | Turning a regression summary into numbers: pass rate, slowest tests, average runtime. |

Each folder has the problem, the commands, their real output and a short **debug notes** section on what went wrong first.

## Run the regression

```console
$ git clone https://github.com/Iam-Abishekkumar/linux-cli-for-dv.git && cd linux-cli-for-dv
$ ./run_regression.sh
TEST                               RESULT
------------------------------------------
01_grep_wc                         PASS
02_sort_uniq                       PASS
03_find                            PASS
04_cut                             PASS
05_sed                             PASS
06_awk                             PASS
07_process_management              PASS
08_permissions                     PASS
09_pipelines                       PASS
10_log_analysis                    PASS
11_mini_challenge_sales            PASS
------------------------------------------
REGRESSION PASSED  11/11 tests
```

Run one exercise with `./run_regression.sh 07`.

## Bugs I hit, and what they taught me

- **Right answer, wrong reason.** `sort names.txt | uniq -c | head -n 1` printed the most frequent name only because it also sorted first alphabetically. Adding `sort -nr` fixed the logic. A passing result is not proof the checker works.
- **The checker observed itself.** `ps -u | grep -c sleep` counted 4 processes instead of 3 because `grep sleep` matched its own process. `pgrep` avoids that.
- **Check the stimulus first.** An ERROR count came out as 2 instead of 3 because a line was missing from the input file, not because the command was wrong.
- **Hidden ties.** `head -n 1` silently drops a tie for first place; `awk 'NR==1 {max=$1} $1==max'` keeps every tied line.

The full list, plus organised command notes, is in [CHEATSHEET.md](CHEATSHEET.md). PDF versions are in [`docs/`](docs/).

## Next challenge

[UVM log triage](challenges/uvm_log_triage/): the same commands on a UVM simulation log (error counts, error IDs, first-failure time, pass/fail verdict). Unsolved for now.

## Layout

```text
linux-cli-for-dv/
├── run_regression.sh            regression runner (PASS/FAIL per exercise)
├── exercises/
│   └── NN_topic/
│       ├── README.md            problem, commands, output, debug notes
│       ├── setup.sh             creates the input files
│       ├── solution.sh          the answers
│       └── golden.log           expected output
├── challenges/uvm_log_triage/   next problem (unsolved)
├── CHEATSHEET.md                organised command notes
├── docs/                        PDF versions of the notes and exercises
└── .github/workflows/           CI that runs the regression on every push
```

## Environment

bash, GNU coreutils, grep, sed, awk, procps (`pgrep`) and psmisc (`killall`). Tested on Ubuntu. The runner sets `LC_ALL=C` so `sort` gives the same order on every machine.
