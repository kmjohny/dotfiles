# README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).
#
# In addition, I recommend the
# [Tomorrow Night theme](https://github.com/chriskempson/tomorrow-theme) and, if
# you're using it on Mac OS X, [iTerm 2](http://www.iterm2.com/) over
# Terminal.app - it has significantly better color fidelity.

# ------------------------------------------------------------------------------
# CONFIGURATION
# The default configuration, that can be overwrite in your .zshrc file
# ------------------------------------------------------------------------------

VIRTUAL_ENV_DISABLE_PROMPT=true

# Define order and content of prompt
#if [ ! -n "${BULLETTRAIN_PROMPT_ORDER+1}" ]; then
#  BULLETTRAIN_PROMPT_ORDER=(
#    time
#    status
#    custom
#    context
#    dir
#    screen
#    perl
#    ruby
#    virtualenv
#    nvm
#    aws
#    go
#    rust
#    elixir
#    kctx
#    git
#    hg
#    cmd_exec_time
#  )
#fi

# Define order and content of prompt
if [ ! -n "${BULLETTRAIN_PROMPT_ORDER+1}" ]; then
  BULLETTRAIN_PROMPT_ORDER=(
    time
    dir
    kctx
    cmd_exec_time
  )
fi
