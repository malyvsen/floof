alias ..="cd .."
alias home="cd ~"
alias media="cd /run/media/$USER"
alias userlist="cut -d: -f1 /etc/passwd"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias eensh="scrot -s -o ~/temp/screenshot.png"
eval $(thefuck --alias)
