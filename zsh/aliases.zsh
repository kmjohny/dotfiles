alias reload!='. ~/.zshrc'

# Alias Help
ahelp() { alias | grep $1 | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Good 'ol Clear Screen command
alias cls='clear'
