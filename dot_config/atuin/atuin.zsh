if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh)"

  if [[ -n "$TMUX" ]]; then
    ATUIN_POPUP_WIDTH=${ATUIN_POPUP_WIDTH:-50}
    ATUIN_POPUP_HEIGHT=${ATUIN_POPUP_HEIGHT:-50}

    _atuin_popup_impl() {
      emulate -L zsh
      zle -I
      local tmpfile query
      tmpfile=$(mktemp /tmp/atuin-popup.XXXXXX)
      query="${LBUFFER}"
      tmux display-popup \
        -E \
        -w "${ATUIN_POPUP_WIDTH}%" \
        -h "${ATUIN_POPUP_HEIGHT}%" \
        "ATUIN_SESSION=$(printf '%q' "$ATUIN_SESSION") ATUIN_SHELL_ZSH=t ATUIN_LOG=error atuin search -i --cmd-only -- $(printf '%q' "$query") 3>$(printf '%q' "$tmpfile") 1>&2 2>&3"
      local result
      result=$(<"$tmpfile")
      rm -f "$tmpfile"
      if [[ -n "$result" ]]; then
        LBUFFER="$result"
        RBUFFER=""
      fi
      zle reset-prompt
    }

    # Override atuin's own ZLE widgets so every keybinding atuin registers uses
    # the popup. Atuin uses _atuin_search in newer versions, _atuin_search_widget
    # in older ones; cover both.
    _atuin_search() { _atuin_popup_impl; }
    _atuin_search_widget() { _atuin_popup_impl; }
    zle -N _atuin_search
    zle -N _atuin_search_widget
  fi
fi
