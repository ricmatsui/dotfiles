#!/usr/bin/env bash
# Names each session after a random first name, so rows in /list-agents and the
# /resume picker are tellable apart at a glance.
#
# Two modes:
#   (no args)  Print an unused name. The `claude` wrapper in zshrc submits it as
#              `/rename <name>`, the startup prompt of a fresh session.
#   --hook     UserPromptSubmit hook: hand the name to Claude Code as
#              sessionTitle on the first prompt. Fallback for sessions the
#              wrapper skipped (an invocation that carries its own arguments).
#
# Why the wrapper leads: only the UserPromptSubmit path persists a title, and it
# needs a prompt to fire. A SessionStart hook's sessionTitle is cached in memory
# and reaches neither the registry (/list-agents) nor the transcript (/resume).
# `/rename` submitted as the startup prompt writes both before the first
# keystroke, and runs locally, so it costs no model turn.
#
# Sessions that already carry a title -- one you renamed, or one already named
# by either mode -- are left alone, so the name is drawn exactly once. Names
# held by live sessions are excluded so two windows never share one.

set -eu

names=(
  Ada Alba Anya Basil Beau Bram Clara Cleo Cora Dane Dax Della
  Edie Elio Esme Faye Finn Freya Gia Gil Gus Hana Hazel Hugo
  Ines Iris Ivo Jules Juno Kai Kira Lena Leo Lila Luca Mabel
  Mira Nadia Nico Nora Odin Otis Paloma Piper Quinn Rafa Remy Rosa
  Rune Sage Selma Silas Sofia Tessa Theo Tova Uma Vera Vince Wren
  Yara Yuri Zara Zeke
)

pick_name() {
  # Names held by sessions whose process is still alive. Stale registry files
  # outlive their process, so check liveness rather than trusting the file.
  # Both config dirs see use here: `clp` sets CLAUDE_CONFIG_DIR, `claude` alone
  # does not, and either kind of session can be holding a name.
  local taken="" dir seen="" f entry pid
  for dir in "${CLAUDE_CONFIG_DIR:-$HOME/.claude}" "$HOME/.claude"; do
    case "$seen" in *"|$dir|"*) continue;; esac
    seen="$seen|$dir|"
    for f in "$dir"/sessions/*.json; do
      [ -f "$f" ] || continue
      entry=$(jq -r '"\(.pid) \(.name // "")"' "$f" 2>/dev/null) || continue
      pid=${entry%% *}
      kill -0 "$pid" 2>/dev/null || continue
      taken="$taken${entry#* }"$'\n'
    done
  done

  local available=() name
  for name in "${names[@]}"; do
    printf '%s' "$taken" | grep -qxF "$name" || available+=("$name")
  done
  [ ${#available[@]} -gt 0 ] || available=("${names[@]}")

  printf '%s\n' "${available[RANDOM % ${#available[@]}]}"
}

if [ "${1:-}" = "--hook" ]; then
  # A hook-set title suppresses Claude's model-generated topic title for the
  # session. `/rename` still overrides by hand.
  if [ -n "$(jq -r '.session_title // empty')" ]; then
    exit 0
  fi
  jq -nc --arg t "$(pick_name)" \
    '{hookSpecificOutput: {hookEventName: "UserPromptSubmit", sessionTitle: $t}}'
else
  pick_name
fi
