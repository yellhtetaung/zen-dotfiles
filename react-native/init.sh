#!/usr/bin/bash

# Aliases for development
alias rnstart='npx react-native start'
alias rninfo="npx react-native info"
alias rnios='npx react-native run-ios'
alias rnandroid='npx react-native run-android'
alias rnasset="npx react-native-asset"
alias rndoctor="npx react-native doctor"

if [[ -d "$ZEN_DIR/react-native" ]]; then
# Import ios.sh
  if [[ -f "$ZEN_DIR/react-native/ios.sh" ]]; then
    source "$ZEN_DIR/react-native/ios.sh"
  fi

# Import android.sh
  if [[ -f "$ZEN_DIR/react-native/android.sh" ]]; then
    source "$ZEN_DIR/react-native/android.sh"
  fi
fi