#!/usr/bin/bash
show_postinstall_usage() {
  echo -e "${blue}${bold}${italic}Welcome to the post-installation script for React Native iOS projects!${reset} "
  echo
  echo -e "${yellow}Usage: podinstall [--mode=<mode>] [--arch=<bool>] [options]${reset}"
  echo
  echo "Modes:" 
  echo -e "  ${green}clean${reset}            – full clean (cache, Pods/, build/, Podfile.lock)"
  echo -e "  ${green}skip-clean${reset}       – skip cleaning, install only"
  echo -e "  ${green}default${reset}          – default clean (deintegrate + rm Pods, build, Podfile.lock)"
  echo
  echo "New Architecture:"
  echo -e "  ${green}true${reset}             – enable New Architecture in Podfile"
  echo -e "  ${green}false${reset}            – disable New Architecture in Podfile"
  echo -e "  ${green}default${reset}          – leave Podfile unchanged"
  echo
  echo "Options:"
  echo -e "  ${green}--repo-update${reset}    – update CocoaPods specs" 
  echo -e "  ${green}--allow-root${reset}     - Allows CocoaPods to run as root"
  echo -e "  ${green}--silent${reset}         - Show nothing"
  echo -e "  ${green}--verbose${reset}        - Show more debugging information"
  echo -e "  ${green}--no-ansi${reset}        - Show output without ANSI codes"
  echo -e "  ${green}--help${reset}           – show this help message"
  echo
  echo "Examples:"
  echo -e "  ${green}podinstall --mode=clean --arch=true --repo-update --verbose${reset}"
  echo -e "  ${green}podinstall --mode=skip-clean --arch=false${reset}"
  echo -e "  ${green}podinstall${reset}"
}

# Function to clean and reinstall CocoaPods dependencies for iOS projects
podinstall() {
  local mode=""
  local enableNewArch=""
  local extra_args=()
  local current_path
  current_path=$(pwd)

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --mode=*)
        mode="${1#--mode=}"
        ;;
      clean|skip-clean|default)
        mode="$1"
        ;;
      --arch=*)
      case "${1#--arch=}" in
          true) enableNewArch=true ;;
          false) enableNewArch=false ;;
          default) enableNewArch="" ;;
          *) echo "Invalid --arch value: ${1#--arch=}" ;;
        esac
        ;;
      true|false|default)
        enableNewArch="$1"
        ;;
      *)
      extra_args+=("$1")
    esac
    shift
  done

  # Check if the help flag is present in extra_args
  # If the help flag is present, show the usage message and exit
  if contains "$extra_args" "--help"; then
    show_postinstall_usage
    return 1
  fi

  echo "Running post-installation tasks..."

  # Checking the current directory to be in the iOS project directory or navigate to the ios directory if it exists
  # If the current path in the ios directory, continue
  # If not, exit with an error message
  if ! contains "$current_path" "ios"; then
    if [[ -d "ios" ]]; then
      cd ios || exit
    else
      echo -e "${red}This script must be run from the root of the iOS project directory.${reset}"
      return 1
    fi
  fi

  # Checking the Podfile to install dependencies
  # The error message will be shown when the Podfile is not found
  if [[ -f Podfile ]]; then
    echo "Podfile found."
  else
    echo -e "${red}No Podfile found in the current directory. Exiting.${reset}"
    return 1
  fi

  # Checking the mode to perform the post-installation tasks
  # If the mode is clean, the script will perform full clean of Pods and Podfile.lock
  # If the mode is skip-clean, the script will skip cleaning of Pods and Podfile.lock
  # If the mode is default, the script will perform default clean of Pods and Podfile.lock
  if [[ "$mode" == "clean" ]]; then
    echo "Performing full clean of Pods and Podfile.lock..."
    pod cache clean --all && pod deintegrate

    if [[ -d 'Pods' ]]; then
      rm -rf Pods || exit
    fi

    if [[ -d 'build' ]]; then
      rm -rf build || exit
    fi

    if [[ -f 'Podfile.lock' ]]; then
      rm Podfile.lock || exit
    fi
  elif [[ "$mode" == "skip-clean" ]]; then
    echo "Skipping cleaning of Pods and Podfile.lock as per user request."
  else
    echo "Cleaning Pods and Podfile.lock..."
    pod deintegrate

    if [[ -d 'Pods' ]]; then
      rm -rf Pods || exit
    fi

    if [[ -d 'build' ]]; then
      rm -rf build || exit
    fi

    if [[ -f 'Podfile.lock' ]]; then
      rm Podfile.lock || exit
    fi
  fi

  # Checking the New Architecture setting to enable or disable in Podfile
  # If the setting is true, the script will enable New Architecture in Podfile
  # If the setting is false, the script will disable New Architecture in Podfile
  # If the setting is default, the script will leave Podfile unchanged
  if [[ $enableNewArch == true ]]; then
    echo "Enabling New Architecture settings in Podfile..."
    sed -i '' 's/# enableNewArch: false/enableNewArch: true/g' Podfile
  elif [[ $enableNewArch == false ]]; then
    echo "Disabling New Architecture settings in Podfile..."
    sed -i '' 's/enableNewArch: true/# enableNewArch: false/g' Podfile
  else
    echo "No changes made to New Architecture settings in Podfile."
  fi

  # Installing CocoaPods dependencies
  echo "Installing CocoaPods dependencies..."
  pod install "${extra_args[@]}"
}
