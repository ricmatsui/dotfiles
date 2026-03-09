#!/usr/bin/env bash

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
dir=$(basename "$cwd")

branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null \
  || git -C "$cwd" --no-optional-locks describe --all HEAD 2>/dev/null)

if [ -n "$branch" ]; then
    branch_part="[$branch] "
else
    branch_part=""
fi

cost_part=$(echo "$input" | jq -r '
  (.cost.total_cost_usd // 0) as $cost
  | " $" + ($cost * 100 | round | . / 100 | tostring)
')

printf "%s%s%s" "$branch_part" "$dir" "$cost_part"
