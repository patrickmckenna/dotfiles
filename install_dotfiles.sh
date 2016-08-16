#!/bin/bash

set -e

DOTFILESDIR=$(dirname $0)
cd $DOTFILESDIR
DOTFILESDIR=$(pwd -P)

for DOTFILE in *; do
  echo "$DOTFILE" | egrep -q '(\.sublime-settings|\.sh)' && continue

  TARGETFILE="$HOME/.$DOTFILE"
  [ "$DOTFILE" = "gitignore" ] && TARGETFILE="$TARGETFILE"_global
  DOTFILEPATH="$DOTFILESDIR/$DOTFILE"
  
  if [ -f "$TARGETFILE" ]
  then
    echo "==> file $TARGETFILE already exists, overwriting it"
    rm "$TARGETFILE"
  fi
  ln -s "$DOTFILEPATH" "$TARGETFILE" 

done

# matplotlib will look here by default for a file called matplotlibrc
# TODO: symlink to that file
mkdir $HOME/.config/matplotlib
