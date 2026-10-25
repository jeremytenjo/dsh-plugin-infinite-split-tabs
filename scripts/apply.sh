#!/usr/bin/env bash
# Apply the infinite-split-tabs patch to a DeepSeek Harness checkout.
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 /path/to/deepseek-harness" >&2
  exit 2
fi

target=$1
root=$(cd "$(dirname "$0")/.." && pwd)
patch="$root/patches/0001-right-sidebar-infinite-splits.patch"

if ! git -C "$target" rev-parse --git-dir >/dev/null 2>&1; then
  echo "error: $target is not a git checkout" >&2
  exit 1
fi

git -C "$target" apply --check "$patch"
git -C "$target" apply "$patch"

echo "Applied $patch"
echo "Next: pnpm install && pnpm run dev:web"
