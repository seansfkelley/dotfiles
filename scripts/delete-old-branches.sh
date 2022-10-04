#!/bin/bash

set -euo pipefail

GITHUB_REPO="???/???"
INTERVAL=$(( 60 * 60 * 24 * 7 * 52 )) # in seconds

SCRIPT_NAME="$0"
function exit_with_usage() {
  echo "Usage: $SCRIPT_NAME -t,--token TOKEN [-y,--yes]"
  exit 1
}

if ! git status > /dev/null 2>&1 ; then
  echo "Error: must be run from inside a git repo."
  exit 1
fi

while [ "${1:-}" != "" ]; do
  case "$1" in
    -h|--help)
      exit_with_usage
      ;;
    -y|--yes)
      SHOULD_DELETE=1
      ;;
    -t|--token)
      GITHUB_TOKEN="$2" ; shift
      ;;
    *)
      exit_with_usage
      ;;
  esac
  shift
done

SHOULD_DELETE="${SHOULD_DELETE:-}"
GITHUB_TOKEN="${GITHUB_TOKEN:-}"
OPEN_PR_BRANCHES_FILE=/tmp/open-branches
OLD_BRANCHES_FILE=/tmp/old-branches
BRANCHES_TO_DELETE_FILE=/tmp/branches-to-delete

if [ -z "$GITHUB_TOKEN" ] ; then
  echo "-t,--token is required"
  exit_with_usage
fi

rm -f "$OPEN_PR_BRANCHES_FILE"
touch "$OPEN_PR_BRANCHES_FILE"

page=1
while true ; do
  branches=$(curl -s -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $GITHUB_TOKEN" \
    "https://api.github.com/repos/$GITHUB_REPO/pulls?state=open&per_page=100&page=$page" | jq -r '.[].head.ref')
  if [ -z "$branches" ]; then
    break
  fi
  echo "$branches" >> "$OPEN_PR_BRANCHES_FILE"
  page=$(( $page + 1 ))
done

rm -f "$OLD_BRANCHES_FILE"
touch "$OLD_BRANCHES_FILE"

NOW=$(date +%s)

# adapted from https://stackoverflow.com/questions/54253714/extract-the-list-of-git-branches-that-are-older-than-specified-time-period
git for-each-ref refs/remotes/origin | while read -r commit _type ref ; do
  ref_ts=$(git log -1 --pretty=%cd --date=format:%s "$commit")
  if [[ $(( NOW - ref_ts )) -ge "$INTERVAL" ]] ; then
    echo "$ref" | sed 's|refs/remotes/origin/||' >> "$OLD_BRANCHES_FILE"
  fi
done

sort "$OPEN_PR_BRANCHES_FILE" | sponge "$OPEN_PR_BRANCHES_FILE"
sort "$OLD_BRANCHES_FILE" | sponge "$OLD_BRANCHES_FILE"

comm -23 "$OLD_BRANCHES_FILE" "$OPEN_PR_BRANCHES_FILE" > "$BRANCHES_TO_DELETE_FILE"

if [ -z "$SHOULD_DELETE" ]; then
  echo "$(cat "$BRANCHES_TO_DELETE_FILE" | wc -l | tr -d ' ') branches slated for deletion. To view:"
  echo "  cat $BRANCHES_TO_DELETE_FILE"
  echo 'Rerun with -y,--yes to delete these branches.'
else
echo "$(cat "$BRANCHES_TO_DELETE_FILE" | wc -l | tr -d ' ') branches slated for deletion."
  while true ; do
    read -r -p "Enter 'I accept responsibility' to confirm; ctrl-C to abort: " confirmation
    if [ "$confirmation" == 'I accept responsibility' ]; then
      echo 'Here we go...'
      cat "$BRANCHES_TO_DELETE_FILE" | xargs -n1 -I % git push origin :%
      break
    fi
  done
fi
