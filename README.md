Dotfile for Steve Zhang

Dotfile management by [RCM](https://github.com/thoughtbot/rcm)

```
brew install rcm
lsrc -d `pwd`
rcup -d `pwd`
```

## Troubleshooting
### Vim
In order to fix vim issue, install Vbundle.vim
1. ` git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
2. launch vim
3. run `:PluginInstall` within vim

### Zsh
Append following zsh customized configuration to generated .zshrc by oh-my-zsh
```
# Extras {{{
### Use ~/.local.zsh to extend ~/.zshrc with custom options
if [[ -f ~/.local.zsh ]]; then
  source ~/.local.zsh
fi
# }}}
```

### fzf
1. Install fzf via `brew install fzf`
2. check change on fzf.zsh and redo the rcup
3. `source ~/.zshrc`

### sed
1. `brew install gnu-sed`


### [z-sh shell syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
1. `brew install zsh-syntax-highlighting`

### java & python sandbox
1. install [java enviornment manager](https://github.com/jenv/jenv)
  1.1 `brew install jenv`
  1.1
  ```
    echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.local.zsh
    echo 'eval "$(jenv init -)"' >> ~/.local.zsh
  ```
2. install [python environment manager](https://github.com/pyenv/pyenv)
  1.1 `brew install pyenv`
  1.2
  ```
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.local.zsh
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.local.zsh
    echo 'eval "$(pyenv init - zsh)"' >> ~/.local.zsh
  ```


### tmux
1. install [tmux]() `brew install tmux`
2. install [tpm](https://github.com/tmux-plugins/tpm) `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
3. install tmux plugins (include tpm): within tmux session to controlA + capital I to reload
