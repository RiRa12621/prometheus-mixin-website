#!/bin/bash

set -euo pipefail

make
if [[ $(git status --porcelain) ]]; then
  git status
  git diff
  git add .
  git config --global user.name "${GITHUB_ACTOR}"
  git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
  git commit -m "chore(all): update website"
  git push origin main
fi