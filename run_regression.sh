#!/usr/bin/env bash
# run_regression.sh: runs every exercise like a verification regression.
#
#   setup.sh     stimulus      creates the input files
#   solution.sh  DUT           the commands being checked
#   golden.log   reference     expected output
#
# A test passes when the actual output matches golden.log exactly.
# Usage:  ./run_regression.sh          run everything
#         ./run_regression.sh 05       run only exercises whose folder starts with 05
#         ./run_regression.sh --update regenerate golden.log files (review the diff before committing!)

set -u
export LC_ALL=C                      # same sort order on every machine
ROOT=$(cd "$(dirname "$0")" && pwd)
UPDATE=0; FILTER=""
for arg in "$@"; do
  case "$arg" in
    --update) UPDATE=1 ;;
    *)        FILTER="$arg" ;;
  esac
done

if [ -t 1 ] || [ -n "${CI:-}" ]; then G=$'\e[32m'; R=$'\e[31m'; Y=$'\e[33m'; B=$'\e[1m'; N=$'\e[0m'; else G=; R=; Y=; B=; N=; fi

pass=0; fail=0; total=0
printf '%s%-34s %s%s\n' "$B" "TEST" "RESULT" "$N"
printf '%s\n' "------------------------------------------"
for dir in "$ROOT"/exercises/"${FILTER}"*/; do
  [ -f "$dir/solution.sh" ] || continue
  name=$(basename "$dir")
  total=$((total + 1))
  work=$(mktemp -d)
  ( cd "$work" && EX_DIR="$dir" bash -c '. "$EX_DIR/setup.sh"; . "$EX_DIR/solution.sh"' ) > "$work/actual.log" 2>&1

  if [ "$UPDATE" -eq 1 ]; then
    cp "$work/actual.log" "$dir/golden.log"
    printf '%-34s %sUPDATED%s\n' "$name" "$Y" "$N"
  elif diff -u --label "golden.log" --label "actual" "$dir/golden.log" "$work/actual.log" > "$work/diff.txt"; then
    printf '%-34s %sPASS%s\n' "$name" "$G" "$N"
    pass=$((pass + 1))
  else
    printf '%-34s %sFAIL%s\n' "$name" "$R" "$N"
    sed 's/^/    /' "$work/diff.txt"
    fail=$((fail + 1))
  fi
  rm -rf "$work"
done
printf '%s\n' "------------------------------------------"
if [ "$total" -eq 0 ]; then echo "No exercises matched '${FILTER}'"; exit 1; fi
[ "$UPDATE" -eq 1 ] && { echo "Golden files regenerated: review with 'git diff' before committing."; exit 0; }
if [ "$fail" -eq 0 ]; then
  printf '%sREGRESSION PASSED%s  %d/%d tests\n' "$G$B" "$N" "$pass" "$total"
else
  printf '%sREGRESSION FAILED%s  %d passed, %d failed\n' "$R$B" "$N" "$pass" "$fail"
  exit 1
fi
