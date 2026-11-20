#!/usr/bin/env bash
set -e
PORT="${1:-8000}"
echo "Starting Stardust Countdown locally at http://localhost:${PORT}"
python3 -m http.server "${PORT}"
