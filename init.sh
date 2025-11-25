#!/usr/bin/bash

ZEN_DIR="${ZEN_DIR:-$HOME/.config/zen}"

if [[ -d "$ZEN_DIR/alias" ]]; then
  if [[ -f "$ZEN_DIR/alias/init.sh" ]]; then
    source "$ZEN_DIR/alias/init.sh"
  fi
fi

# For Ruby Gems
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# For Android Studio and React Native Development

# For Java 11
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home

# For Java 17
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# For Java 21
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-21.jdk/Contents/Home

# For Java 25
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-25.jdk/Contents/Home

# Android SDK and NDK setup
export ANDROID_HOME=$HOME/Library/Android/sdk # Adjust if your SDK is in a different location
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/27.1.12297006 # Replace {your_ndk_version} with the specific NDK version you want to use (e.g., 25.1.8765903)
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

# Add Android SDK and NDK tools to PATH
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_NDK_HOME

# Source utils.sh if it exists in the same directory as this script
if [[ -f "$ZEN_DIR/utils.sh" ]]; then
  source "$ZEN_DIR/utils.sh"
fi

if [[ -f "$ZEN_DIR/typography.sh" ]]; then
  source "$ZEN_DIR/typography.sh"
fi

if [[ -d "$ZEN_DIR/react-native" ]]; then
  if [[ -f "$ZEN_DIR/react-native/init.sh" ]]; then
    source "$ZEN_DIR/react-native/init.sh"
  fi
fi