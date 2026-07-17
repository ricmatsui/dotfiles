#!/usr/bin/env bash
# PreToolUse hook: deny Bash commands that invoke `sops` as a binary.
# Allows `sops` appearing as a filename argument (e.g. `cat sops.md`).
# Limitations: cannot catch indirect invocations like `xargs sops`,
# `find -exec sops`, `$VAR -d`, or base64-decoded shells. For a hard
# guarantee, use a PATH shim (~/.claude/shims/sops) or a sandbox.

set -eu

cmd=$(jq -r '.tool_input.command // empty')

# Match `sops` in command position:
#   - at start of line, or after a shell operator (; & | ( ` " ')
#   - optionally preceded by env-var assignments (FOO=bar ) and/or
#     launcher prefixes (env, sudo, command, exec) and/or an absolute path
#   - followed by whitespace, end-of-string, or a shell operator
if printf '%s' "$cmd" | grep -Eqi '(^|[;&|()`"'\''])[[:space:]]*((env|sudo|command|exec)[[:space:]]+|[[:alnum:]_]+=[^[:space:]]+[[:space:]]+)*(/[^[:space:]]*)?sops([[:space:]]|$|[;&|<>])'; then
  printf '%s' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"sops invocation is blocked by user policy"}}'
fi
