#debug-only
#set -x

# brew
alias ibrew="arch -x86_64 /opt/brew/bin/brew"
[[ -d /opt/brew/share/zsh/site-functions/ ]] && fpath+=(/opt/brew/share/zsh/site-functions/)

# manage java environment
export PATH=$HOME/.jenv/bin:$PATH
eval "$(jenv init -)"
# prefer GNU sed
export PATH=/opt/brew/opt/gnu-sed/libexec/gnubin:$PATH
# export pip installed bin
export PATH=$PATH:$HOME/Library/Python/3.8/bin

export EDITOR=vim

# Improvoed cat and fd
### Alias cat to [bat](https://github.com/sharkdp/bat)
hash bat 2>/dev/null && alias cat='bat'
### Alias find to [fd](https://github.com/sharkdp/fd)
#hash fd 2>/dev/null && alias find='fd'

# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z/jump around https://github.com/rupa/z
[ -f ~/.zsh/z.sh ] && . $HOME/.zsh/z.sh

# kubenetes autocompletion
source <(kubectl completion zsh)

list_ec2() {
    aws ec2 describe-instances \
        --no-cli-pager \
        --output table \
        --filters Name=tag-key,Values=Name \
        --query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Type:InstanceType,Name:Tags[?Key==`Name`]|[0].Value,State:State.Name,AMI:ImageId}'
}

eks17_ami_history() {
    aws ssm get-parameter-history --name /AIS/AMI/"AmazonEKS17Linux"/Id \
        | jq --arg IMAGE $1 '.Parameters[]| select (.Value==$IMAGE) | {date: .LastModifiedDate, ami: .Value}'
}

eks18_ami_history() {
    aws ssm get-parameter-history --name /AIS/AMI/"AmazonEKS18Linux"/Id \
        | jq --arg IMAGE $1 '.Parameters[]| select (.Value==$IMAGE) | {date: .LastModifiedDate, ami: .Value}'
}

eks19_ami_history() {
    aws ssm get-parameter-history --name /AIS/AMI/"AmazonEKS19Linux"/Id \
        | jq --arg IMAGE $1 '.Parameters[]| select (.Value==$IMAGE) | {date: .LastModifiedDate, ami: .Value}'
}

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
