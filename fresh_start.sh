#!/usr/bin/env bash
# fresh_start.sh: start the 10 practice problems from zero in YOUR copy of linux-cli-for-dv.
#
#   ./fresh_start.sh
#
# Puts the empty solution.sh back in every practice/ problem (removes the previous solver's answers),
# points the README badge at your own GitHub repo, and refreshes the progress table.
# The solved exercises in exercises/ are not touched: they are worked examples to learn from.

set -euo pipefail
ROOT=$(cd "$(dirname "$0")" && pwd)
cd "$ROOT"

read -r -p "This empties all 10 practice/*/solution.sh files. Continue? [y/N] " ok
case "$ok" in y|Y|yes) ;; *) echo "Nothing changed."; exit 0 ;; esac

for t in practice/.templates/*.sh; do
  cp "$t" "practice/$(basename "$t" .sh)/solution.sh"
done

# Point the CI badge and links at your own repo (taken from git's origin URL).
owner=$(git remote get-url origin 2>/dev/null | sed -n 's#.*github\.com[:/]\([^/]*\)/.*#\1#p')
old=$(sed -n 's#.*github\.com/\([^/]*\)/linux-cli-for-dv/actions.*#\1#p' README.md | head -n 1)
if [ -n "$owner" ] && [ -n "$old" ] && [ "$owner" != "$old" ]; then
  sed -i "s#github.com/$old/linux-cli-for-dv#github.com/$owner/linux-cli-for-dv#g" README.md
fi

./run_regression.sh p >/dev/null 2>&1 || true     # refresh the practice table in README.md
echo "Fresh start: all 10 practice problems are TODO now. Begin with:"
echo "    cd practice/p01_grep_more && cat README.md"
echo "Save your progress:  git add -A && git commit -m \"Fresh start\" && git push"
