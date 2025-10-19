#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
echo "[clean] buildroot distclean…"
make -C "${ROOT}/buildroot" distclean
echo "[clean] done."



