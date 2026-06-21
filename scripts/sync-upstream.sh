#!/usr/bin/env bash
set -euo pipefail

UPSTREAM_REMOTE="${UPSTREAM_REMOTE:-upstream}"
BASE_BRANCH="${BASE_BRANCH:-main}"
TARGET_BRANCH="${1:-main}"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Run this script from inside a git repository."
  exit 1
fi

if ! git remote get-url "$UPSTREAM_REMOTE" >/dev/null 2>&1; then
  echo "Remote '$UPSTREAM_REMOTE' does not exist."
  echo "Add it first, for example:"
  echo "  git remote add upstream https://github.com/mpgirro/docker-pihole-unbound.git"
  exit 1
fi

if [ -n "$(git status --porcelain)" ]; then
  echo "Working tree is not clean. Commit or stash changes first."
  exit 1
fi

echo "Fetching latest refs from '$UPSTREAM_REMOTE'..."
git fetch "$UPSTREAM_REMOTE"

echo "Checking out '$TARGET_BRANCH'..."
git checkout "$TARGET_BRANCH"

echo "Rebasing '$TARGET_BRANCH' on '$UPSTREAM_REMOTE/$BASE_BRANCH'..."
git rebase "$UPSTREAM_REMOTE/$BASE_BRANCH"

echo "Done. Push your updated branch with:"
echo "  git push --force-with-lease origin $TARGET_BRANCH"