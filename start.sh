#!/bin/bash
set -e

PORT="${PORT:-10000}"

echo "Starting WeTTY on port ${PORT}..."

exec wetty \
  --port "${PORT}" \
  --host 0.0.0.0 \
  --command bash
