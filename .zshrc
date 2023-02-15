if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# install:
# sudo apt install zsh & sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# global vars
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG="$HOME/.config/zsh"

# local vars
ANTIGEN="$ZSH_CONFIG/antigen.zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
HISTFILE="$ZSH_CONFIG/.zsh_history"
EDITOR="nvim"

touch "$ZSH_CONFIG/private.zsh" # for private configuration

autoload add-zsh-hook

zstyle ':omz:update' mode auto # update automatically without asking

# install antigen
if ! test -f "$ANTIGEN"; then
    echo "Antigen downoload"
    curl -L git.io/antigen > "$ANTIGEN"
    echo "Success"
fi

source "$ANTIGEN"

# opts
setopt hist_ignore_dups # ignore duplicates in historу

#antigen (https://github.com/unixorn/awesome-zsh-plugins)
antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle systemd
antigen bundle sudo
antigen bundle BaggerFast/venv-auto-zsh --branch=main

antigen apply

# sources
source "$ZSH/oh-my-zsh.sh"
source "$ZSH_CONFIG/aliases/main.zsh"
source "$ZSH_CONFIG/private.zsh"
source "$ANTIGEN"

prompt_context() {}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
