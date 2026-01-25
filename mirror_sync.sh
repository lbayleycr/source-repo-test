#!/usr/bin/env bash
set -e

echo "Fetching full history + tags..."
git fetch --all --tags

if [[ -z "$TARGET_URL" ]]; then
  echo "ERROR: TARGET_URL is not set"
  exit 1
fi

if [[ -z "$GIT_TOKEN" ]]; then
  echo "ERROR: GIT_TOKEN is not set"
  exit 1
fi

git remote remove mirror 2>/dev/null || true
git remote add mirror "https://x-access-token:${GIT_TOKEN}@${TARGET_URL#https://}"

git push mirror --mirror