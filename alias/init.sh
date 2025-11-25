#!/usr/bin/bash

ALIAS_DIR="$ZEN_DIR/alias"

if [[ -f "$ALIAS_DIR/common.sh" ]]; then
  source "$ALIAS_DIR/common.sh"
fi

if [[ -f "$ALIAS_DIR/git.sh" ]]; then
  source "$ALIAS_DIR/git.sh"
fi