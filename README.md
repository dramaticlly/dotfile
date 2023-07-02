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
