#!/usr/bin/env bash
set -e
REPO_NAME="${1:-stardust-countdown}"

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) not found. Please install gh or follow Method 2B in DEPLOY_GUIDE.md."
  exit 1
fi

git init -b main
git add index.html .nojekyll DEPLOY_GUIDE.md deploy_local.sh deploy_local.bat deploy_github.sh
git commit -m "Deploy Stardust Countdown static site" || true

gh repo create "${REPO_NAME}" --public --source=. --remote=origin --push

OWNER="$(gh api user -q .login)"
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  "/repos/${OWNER}/${REPO_NAME}/pages" \
  -f source[branch]=main \
  -f source[path]=/ || true

echo ""
echo "Deployment triggered!"
echo "Repo URL:  https://github.com/${OWNER}/${REPO_NAME}"
echo "Live URL:  https://${OWNER}.github.io/${REPO_NAME}/"
