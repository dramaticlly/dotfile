#debug-only
#set -x

export EDITOR=vim
export AWS_PAGER=

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
export PATH=$HOME/.jenv/shims:$PATH
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
unset JDK_HOME
source '/opt/homebrew/Cellar/jenv/0.5.6/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
source "$HOME/.jenv/plugins/export/etc/jenv.d/init/export_jenv_hook.zsh"
jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}
# <<< jenv <<<

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
zsh_file_to_source="/opt/brew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f $zsh_file_to_source ] && source $zsh_file_to_source
# <<< zsh syntax highlighting <<<
