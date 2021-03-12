#debug-only
#set -x

# brew
alias ibrew="arch -x86_64 /opt/brew/bin/brew"
[[ -d /opt/brew/share/zsh/site-functions/ ]] && fpath+=(/opt/brew/share/zsh/site-functions/)

# manage java environment
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

unset JAVA_HOME
JAVA_HOME="$(/usr/libexec/java_home -v 11.0)"
export JAVA_HOME
PATH=$JAVA_HOME/bin:$PATH
export PATH

# Improvoed cat and fd
### Alias cat to [bat](https://github.com/sharkdp/bat)
hash bat 2>/dev/null && alias cat='bat'
### Alias find to [fd](https://github.com/sharkdp/fd)
#hash fd 2>/dev/null && alias find='fd'

# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z/jump around https://github.com/rupa/z
[ -f ~/.zsh/z.sh ] && . $HOME/.zsh/z.sh

# import all alias
[ -f ~/.alias ] && source ~/.alias && echo 'loaded alias files'

# git autocompletion https://oliverspryn.medium.com/adding-git-completion-to-zsh-60f3b0e7ffbc
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# auto completion
autoload -U compinit && compinit -u

# zsh syntax highlighting
zsh_file_to_source="/opt/brew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f $zsh_file_to_source ] && source $zsh_file_to_source
