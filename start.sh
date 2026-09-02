#!/bin/bash
set -e

PORT="${PORT:-10000}"

echo "Starting Ubuntu web terminal on port ${PORT}..."

exec ttyd \
    -p "${PORT}" \
    -i 0.0.0.0 \
    -W \
    /bin/bash
