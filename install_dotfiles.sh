#!/bin/bash

# symlinks all dotfiles into home directory

set -e

DOTFILESDIR=$(dirname $0)
cd $DOTFILESDIR
DOTFILESDIR=$(pwd -P)

for DOTFILE in *; do
  # should put these into subdirs
  echo "$DOTFILE" | egrep -q '(\.sublime-settings|\.sh|\.py)' && continue

  DOTFILEPATH="$DOTFILESDIR/$DOTFILE"
  TARGETFILE="$HOME/.$DOTFILE"

  # handle some special cases
  if [ "$DOTFILE" = "gitignore" ]
  then
    TARGETFILE="$TARGETFILE"_global
  elif [ $DOTFILE = "matplotlibrc" ]
  then
    [ -d "$HOME/.config/matplotlib" ] || mkdir -p "$HOME/.config/matplotlib"
    TARGETFILE="$HOME/.config/matplotlib/matplotlibrc"
  fi

  if [ -f "$TARGETFILE" ] || [ -L "$TARGETFILE" ]
  then
    echo "==> $TARGETFILE already exists, skipping..."
    continue
  fi
  ln -s "$DOTFILEPATH" "$TARGETFILE" 
done

./set_macos_prefs.sh
