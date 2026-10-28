#!/bin/bash
set -euo pipefail

# Native installer; Claude Code keeps itself updated after this. Logging in stays manual.
if [ -x "$HOME/.local/bin/claude" ] || command -v claude >/dev/null; then
    exit 0
fi
curl -fsSL https://claude.ai/install.sh | bash
echo "Claude Code installed; run claude to log in"
