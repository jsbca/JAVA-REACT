#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

cd "${REPO_DIR}/frontend"
if [ ! -d node_modules ]; then
  npm install
fi

npm run build:backend

cd "${REPO_DIR}"
"${REPO_DIR}/scripts/dev-start.sh"
