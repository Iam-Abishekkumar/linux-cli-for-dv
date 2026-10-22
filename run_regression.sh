#!/usr/bin/env bash
# run_regression.sh: runs every exercise like a verification regression.
#
#   setup.sh     stimulus      creates the input files
#   solution.sh  DUT           the commands being checked
#   golden.log   reference     expected output
#
# A test passes when the actual output matches golden.log exactly.
# exercises/  my solved exercises            PASS or FAIL
# practice/   problems you solve yourself    TODO (a "# TODO: your command" line is left), PASS or FAIL
#
# Usage:  ./run_regression.sh          run everything
#         ./run_regression.sh 05       run only exercises whose folder starts with 05
#         ./run_regression.sh p03      run only practice problem p03 (also shows the diff while it is TODO)
#         ./run_regression.sh --update regenerate golden.log files of exercises/ (never practice/;
#                                      review the diff before committing!)

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
TODO_MARK="# TODO: your command"

if [ -t 1 ] || [ -n "${CI:-}" ]; then G=$'\e[32m'; R=$'\e[31m'; Y=$'\e[33m'; B=$'\e[1m'; N=$'\e[0m'; else G=; R=; Y=; B=; N=; fi

pass=0; fail=0; total=0          # exercises/
ppass=0; pfail=0; ptodo=0        # practice/
STATUS=$(mktemp)
trap 'rm -f "$STATUS"' EXIT

printf '%s%-34s %s%s\n' "$B" "TEST" "RESULT" "$N"
printf '%s\n' "------------------------------------------"
for dir in "$ROOT"/exercises/"${FILTER}"*/ "$ROOT"/practice/"${FILTER}"*/; do
  [ -f "$dir/solution.sh" ] || continue
  name=$(basename "$dir")
  practice=0; case "$dir" in "$ROOT"/practice/*) practice=1 ;; esac
  [ "$UPDATE" -eq 1 ] && [ "$practice" -eq 1 ] && continue   # never overwrite a practice golden.log
  work=$(mktemp -d)
  ( cd "$work" && EX_DIR="$dir" bash -c '. "$EX_DIR/setup.sh"; . "$EX_DIR/solution.sh"' ) > "$work/actual.log" 2>&1

  if [ "$UPDATE" -eq 1 ]; then
    cp "$work/actual.log" "$dir/golden.log"
    printf '%-34s %sUPDATED%s\n' "$name" "$Y" "$N"
    rm -rf "$work"; continue
  fi

  diff -u --label "golden.log" --label "actual" "$dir/golden.log" "$work/actual.log" > "$work/diff.txt"; same=$?
  left=0; [ "$practice" -eq 1 ] && left=$(grep -c "^$TODO_MARK" "$dir/solution.sh")
  if [ "$practice" -eq 1 ] && [ "$left" -gt 0 ]; then
    tasks=$(grep -c '^echo "## Task' "$dir/solution.sh")
    printf '%-34s %sTODO%s  %d of %d tasks left: edit solution.sh\n' "$name" "$Y" "$N" "$left" "$tasks"
    [ ${#FILTER} -ge 3 ] && [ "$same" -ne 0 ] && sed 's/^/    /' "$work/diff.txt"
    ptodo=$((ptodo + 1)); echo "${name%%_*} TODO" >> "$STATUS"
  elif [ "$same" -eq 0 ]; then
    printf '%-34s %sPASS%s\n' "$name" "$G" "$N"
    if [ "$practice" -eq 1 ]; then ppass=$((ppass + 1)); echo "${name%%_*} PASS" >> "$STATUS"; else pass=$((pass + 1)); fi
  else
    printf '%-34s %sFAIL%s\n' "$name" "$R" "$N"
    sed 's/^/    /' "$work/diff.txt"
    if [ "$practice" -eq 1 ]; then pfail=$((pfail + 1)); echo "${name%%_*} FAIL" >> "$STATUS"; else fail=$((fail + 1)); fi
  fi
  [ "$practice" -eq 1 ] || total=$((total + 1))
  rm -rf "$work"
done
printf '%s\n' "------------------------------------------"
ptotal=$((ppass + pfail + ptodo))
if [ $((total + ptotal)) -eq 0 ] && [ "$UPDATE" -eq 0 ]; then echo "No exercises matched '${FILTER}'"; exit 1; fi
[ "$UPDATE" -eq 1 ] && { echo "Golden files regenerated: review with 'git diff' before committing."; exit 0; }

# Practice status in the README table (local runs only; CI never edits files)
if [ -z "${CI:-}" ] && [ -s "$STATUS" ] && grep -q '<!-- practice-progress -->' "$ROOT/README.md"; then
  t=$(mktemp)
  awk -v sf="$STATUS" '
    BEGIN { while ((getline l < sf) > 0) { split(l, a, " "); st[a[1]] = a[2] } }
    /^[|] p[0-9][0-9] [|]/ { n = substr($0, 3, 3)
      if (n in st) { s = st[n]; icon = (s == "PASS") ? "✅ solved" : (s == "FAIL") ? "❌ check failed" : "⬜ to do"
                     sub(/[|] [^|]*[|]$/, "| " icon " |") } }
    { print }' "$ROOT/README.md" > "$t"
  solved=$(grep -c '^| p[0-9][0-9] |.*| ✅ solved |$' "$t")
  sed -i "s#<!-- practice-progress -->.*<!-- /practice-progress -->#<!-- practice-progress -->**Practice: $solved / 10 solved**<!-- /practice-progress -->#" "$t"
  cat "$t" > "$ROOT/README.md"; rm -f "$t"
fi

summary=""
[ "$total" -gt 0 ] && summary="$((pass)) / $total exercises"
[ "$ptotal" -gt 0 ] && summary="${summary:+$summary  ·  }practice: $ppass solved, $ptodo to do"
if [ $((fail + pfail)) -eq 0 ]; then
  printf '%sREGRESSION PASSED%s  %s\n' "$G$B" "$N" "$summary"
else
  printf '%sREGRESSION FAILED%s  %s  ·  %d failed\n' "$R$B" "$N" "$summary" "$((fail + pfail))"
  exit 1
fi
