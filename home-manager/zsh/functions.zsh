#!/bin/env zsh
# debuging info

NVIM_APP_DIR=nvim_apps
NVIM_APPS_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}/$NVIM_APP_DIR
function nvims() {
  # get a list of directories only in $NVIM_APPS_CONFIG_HOME
  local items=($(ls -D $NVIM_APPS_CONFIG_HOME))
  echo $items
  echo "Using directory $NVIM_APPS_CONFIG_HOME"
  
  # and use fzf to select one
  #items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$NVIM_APP_DIR/$config nvim $@
}

function nvims_add() {
  local appname=$1
  local appdir=$NVIM_APPS_CONFIG_HOME/$appname
  if [[ -d $appdir ]]; then
    echo "App already exists"
    return 1
  fi
  mkdir $appdir
  echo "App $appname created"  
}


# Chooser for AWS Profile
function aws_profile_chooser() {
  local AWS_CONFIG_FILE=~/.aws/config
  if [ ! -f $AWS_CONFIG_FILE ]; then
    echo "No Profiles configured" >&2
    exit 1
  fi

  # grab profile lines and cut out the profile name, need to remove the trailing ']'
  local profiles=($(grep profile $AWS_CONFIG_FILE | cut -d ' ' -f2 | sed 's/]//'))

  # display options
  profile=$(printf "%s\n" "${profiles[@]}" | fzf --prompt="Choose AWS Profile" --height=~50% --layout=reverse --border --exit-0)
  # set selected option
  if [[ -z $profile ]]; then
    echo "Nothing selected"
    return 0
  fi

  export AWS_PROFILE=$profile
}
