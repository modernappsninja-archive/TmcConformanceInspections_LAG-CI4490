#!/bin/bash

## Gather branch name for current pullrequst and declare as CURRENT_BRANCH
CURRENT_BRANCH=$(curl -s https://api.github.com/repos/$REPO_OWNER/$APP_NAME/pulls/$PULL_NUMBER |  jq -r '.head.ref')
echo "CURRENT_BRANCH VALUE IS:"
echo $CURRENT_BRANCH

## create directory for working clone used to process script updates
mkdir /workspace/pr$PULL_NUMBER
git clone $SOURCE_URL
cd $APP_NAME

## checkout branch for current pr
git fetch origin $CURRENT_BRANCH
git checkout $CURRENT_BRANCH

## Enter any of your own commands here. If the results modify the contents of this pullrequest, the changes will be merged back into the pullrequest.
echo "echo from the post-pr-run.sh"

## add and commit the changes made to the repo and push back into the pullrequest
git add .
git commit -m "pr$PULLNUMBER"
git push origin $CURRENT_BRANCH
