alias home="cd ~"
alias media="cd /run/media/$USER"
alias list_users="cut -d: -f1 /etc/passwd"
alias highlight="grep --color=always"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias show_off="neofetch --w3m"
eval $(thefuck --alias)
