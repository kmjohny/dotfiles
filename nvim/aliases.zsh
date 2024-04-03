alias vim=nvim

#### Neovim Distribution switcher ####
# alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
# alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias cvim="NVIM_APPNAME=NvChad nvim"
alias avim="NVIM_APPNAME=astronvim nvim"
alias avimv3="NVIM_APPNAME=astronvim_v3 nvim"

function nvims() {
  # items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  items=("default" "LunarVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  nvimcmd=nvim
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "LunarVim" ]] then
    config=""
    nvimcmd=lvim
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config $nvimcmd $@
}