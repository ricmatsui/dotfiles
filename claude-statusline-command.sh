#!/usr/bin/env bash

input=$(cat)

red=$'\e[1;31m'
reset=$'\e[0m'

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
dir=$(basename "$cwd")

branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null \
  || git -C "$cwd" --no-optional-locks describe --all HEAD 2>/dev/null)

if [ -n "$branch" ]; then
    branch_part="[$branch] "
else
    branch_part=""
fi

ctx_part=$(echo "$input" | jq -r '
  (.context_window.total_input_tokens // 0) as $tok
  | " " + (($tok / 1000) | floor | tostring) + "k"
')

# Prompt cache expiry is not in the status line input, so derive it from the
# transcript: TTL comes from which ephemeral bucket the cache writes landed in,
# anchored to the entry before the last response (i.e. when that request went out).
# Sidechain entries are subagent requests against a different cache prefix.
cache_part=""
transcript=$(echo "$input" | jq -r '.transcript_path // ""')
if [ -f "$transcript" ]; then
    cache_part=$(tail -n 800 "$transcript" | jq -rs --argjson now "$(date +%s)" --arg red "$red" --arg reset "$reset" '
      [ .[]
        | select(.timestamp != null and (.type == "user" or .type == "assistant") and (.isSidechain != true))
        | { t: .type,
            ts: (.timestamp | sub("\\.[0-9]+Z$"; "Z") | fromdateiso8601),
            cc: (.message.usage.cache_creation // null),
            usage: (.message.usage != null) } ] as $all
      | ([ range(0; ($all | length)) as $i
           | select($all[$i].t == "assistant" and $all[$i].usage) | $i ] | last) as $i
      | if $i == null then empty else
          ( [ $all[range(0; $i + 1)].cc
              | select(. != null)
              | select((.ephemeral_1h_input_tokens // 0) > 0 or (.ephemeral_5m_input_tokens // 0) > 0) ]
            | last ) as $cc
        | (if $cc == null then 300
           elif ($cc.ephemeral_1h_input_tokens // 0) > 0 then 3600
           else 300 end) as $ttl
        | (if $i > 0 then $all[$i - 1].ts else $all[$i].ts end) as $sent
        | ($sent + $ttl - $now) as $left
        | if $left <= 0 then " \($red)EXP\($reset)"
          elif $left >= 3600 then " \(($left / 3600) | floor)h\((($left % 3600) / 60) | floor)m"
          elif $left >= 60 then " \(($left / 60) | floor)m"
          else " \($left)s" end
        end
    ' 2>/dev/null)
fi

# Session (5-hour) rate limit usage and time until it resets.
limit_part=$(echo "$input" | jq -r --argjson now "$(date +%s)" '
  .rate_limits.five_hour // empty
  | " | " + ((.used_percentage // 0) | floor | tostring) + "%"
    + ( ((.resets_at // 0) - $now) as $left
        | if (.resets_at // 0) == 0 then ""
          elif $left <= 0 then "/0m"
          elif $left >= 3600 then "/\(($left / 3600) | floor)h\((($left % 3600) / 60) | floor)m"
          elif $left >= 60 then "/\(($left / 60) | floor)m"
          else "/\($left)s" end )
')

cost_part=$(echo "$input" | jq -r '
  (.cost.total_cost_usd // 0) as $cost
  | " $" + ($cost * 100 | round | . / 100 | tostring)
')

printf "%s%s%s%s%s%s" "$branch_part" "$dir" "$ctx_part" "$cache_part" "$cost_part" "$limit_part"
