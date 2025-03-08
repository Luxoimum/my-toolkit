#!/usr/bin/env bash
#
# install-my-toolkit.sh: Installs the my-toolkit script into a user bin directory.
# Usage:
#   ./install-my-toolkit.sh /path/to/my-toolkit [install-dir]
#
# If [install-dir] is omitted, defaults to $HOME/.local/bin.
# Then you can run "my-toolkit" from any directory once the path is in your PATH variable.

set -e  # Exit on any error

function usage() {
  cat <<EOF
Example:
  ./install-my-toolkit.sh  # Installs into \$HOME/.local/bin by default

After installing, ensure that the install directory is in your PATH.
EOF
  exit 1
}

SCRIPT_PATH="./my-toolkit"
INSTALL_DIR="$HOME/.local/bin"

# Ensure the directory exists
mkdir -p "$INSTALL_DIR"

# Copy the script
cp "$SCRIPT_PATH" "$INSTALL_DIR/my-toolkit"
chmod +x "$INSTALL_DIR/my-toolkit"

echo "Installed 'my-toolkit' to $INSTALL_DIR/my-toolkit."

# Check if INSTALL_DIR is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo "Warning: $INSTALL_DIR is not in your PATH."
  echo "To fix this, add the following line to your shell rc file (e.g. ~/.bashrc or ~/.zshrc):"
  echo "  export PATH=\"\$PATH:$INSTALL_DIR\""
fi

# Add shortcut to the .zshrc or .bashrc file
# Check if the shell is zsh
if [ -n "$ZSH_VERSION" ]; then
  SHELL_RC="$HOME/.zshrc"
else
  SHELL_RC="$HOME/.bashrc"
fi

echo "Adding shortcut to $SHELL_RC"
echo "alias mtk=\"$INSTALL_DIR/my-toolkit\"" >> "$SHELL_RC"
echo "alias tkw=\"$INSTALL_DIR/my-toolkit workspace\"" >> "$SHELL_RC"
echo "alias tks=\"$INSTALL_DIR/my-toolkit skeleton\"" >> "$SHELL_RC"

echo "Done. You can now run 'my-toolkit' from any directory, provided $INSTALL_DIR is in your PATH."

