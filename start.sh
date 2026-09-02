#!/bin/bash
set -e

PORT="${PORT:-10000}"

echo "Node: $(node --version)"
echo "npm: $(npm --version)"
echo "Starting WeTTY on port ${PORT}..."

exec wetty \
    --host 0.0.0.0 \
    --port "${PORT}" \
    --command /bin/bash
