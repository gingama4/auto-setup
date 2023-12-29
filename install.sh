#!/usr/bin/env bash

set -eu

INSTALL_DIR="${INSTALL_DIR:-$HOME/ghq/github.com/gingama4/auto-setup}"
CI=${CI:-0}

if [ $CI -ne 1 ]; then
  if [ -d "$INSTALL_DIR" ]; then
    echo "Updating..."
    git -C "$INSTALL_DIR" pull
  else
    echo "Installing..."
    git clone https://github.com/gingama4/auto-setup "$INSTALL_DIR"
  fi
fi

/usr/bin/env bash "$INSTALL_DIR/setup.sh" "$@"

