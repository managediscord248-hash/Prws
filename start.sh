#!/bin/bash
set -e

export PORT="${PORT:-10000}"

echo "================================"
echo " Ubuntu 24.04 Web Terminal"
echo " Host: azmal"
echo " Port: ${PORT}"
echo "================================"

# Create tmux session
tmux has-session -t azmal 2>/dev/null || \
    tmux new-session -d -s azmal

# Start Supervisor as PID 1
exec /usr/bin/supervisord -n \
    -c /etc/supervisor/supervisord.conf
