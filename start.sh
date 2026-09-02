#!/bin/bash
set -e

PORT="${PORT:-10000}"

echo "================================"
echo " Ubuntu 24.04 Web Terminal"
echo " Host: azmal"
echo " Port: ${PORT}"
echo "================================"

# Make the terminal prompt show root@azmal
export HOSTNAME=azmal
export PS1='root@azmal:\w# '

# Create/reuse a persistent tmux session
tmux new-session -d -s azmal 2>/dev/null || true

# Keep ttyd attached to the same tmux session
exec ttyd \
    -W \
    -p "${PORT}" \
    -i 0.0.0.0 \
    tmux attach-session -t azmal
