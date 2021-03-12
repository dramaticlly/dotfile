Dotfile for Steve Zhang

Dotfile management by [RCM](https://github.com/thoughtbot/rcm)

```
brew install rcm
lsrc
rcup
```

Append following zsh customized configuration to generated .zshrc by oh-my-zsh

```
# Extras {{{
### Use ~/.local.zsh to extend ~/.zshrc with custom options
if [[ -f ~/.local.zsh ]]; then
  source ~/.local.zsh
fi
# }}}
```
