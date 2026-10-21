command -v bat  &>/dev/null && alias cat='bat --paging=never --plain --plain'
command -v btop &>/dev/null && alias htop='btop' && alias top='btop'
command -v nvim &>/dev/null && alias vi='nvim' && alias vim='nvim'

b64d() {
    if [[ -t 0 ]]; then
        printf '%s' "$*" | base64 --decode
    else
        base64 --decode
    fi
}

ksr() {
    kubeseal \
        --controller-name sealed-secrets \
        --controller-namespace sealed-secrets \
        --raw \
        "$@"
}

up() {
  command -v pacman  &>/dev/null && sudo pacman -Syu
  command -v yay     &>/dev/null && yay -Sua
  command -v apt     &>/dev/null && sudo apt update && sudo apt dist-upgrade
  command -v flatpak &>/dev/null && flatpak update
  command -v brew    &>/dev/null && brew update && brew upgrade
  command -v omz     &>/dev/null && omz update
}