#debug-only
#set -x

# >>> zsh best practice: prevent duplicate PATH entries >>>
# This must be set early, before any PATH modifications
typeset -U path PATH
typeset -U fpath FPATH
# <<< zsh best practice <<<

export EDITOR=vim
export AWS_PAGER=

# >>> custom bin directories >>>
# Add custom bin directories (typeset -U ensures no duplicates)
path=("$HOME/.local/bin" /usr/local/bin $path)
# <<< custom bin directories <<<

# >>> brew >>>
[[ -d /opt/brew/share/zsh/site-functions/ ]] && fpath+=(/opt/brew/share/zsh/site-functions/)
# <<< brew <<<

# >>> nodejs/npm/nvm >>>
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# <<< nodejs/npm/nvm <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> jenv >>>
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# auto set JAVA_HOME
# jenv enable-plugin export
# <<< jenv <<<

# >>> pyenv >>>
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
# <<< pyenv <<<

# >>> fuzzy find >>>
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# <<< fuzzy find <<<

# >>> z/jump around >>>
# https://github.com/rupa/z
[ -f ~/.zsh/z.sh ] && . $HOME/.zsh/z.sh
# <<< z/jump around <<<

# >>> k8 >>>
# source <(kubectl completion zsh)
# <<< k8 <<<


# >>> import all alias >>>
[ -f ~/.alias ] && source ~/.alias && echo 'loaded alias files'
# <<< alias <<<


# >>> git autocompletion >>>
# https://oliverspryn.medium.com/adding-git-completion-to-zsh-60f3b0e7ffbc
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
# <<< git autocompletion <<<

# >>> auto completion >>>
autoload -U compinit && compinit -u
# <<< auto completion <<<

# >>> zsh syntax highlighting >>>
# https://github.com/zsh-users/zsh-syntax-highlighting, must at the end
zsh_file_to_source="$(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f $zsh_file_to_source ] && source $zsh_file_to_source
# <<< zsh syntax highlighting <<<
