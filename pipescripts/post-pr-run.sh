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

## add any commands below that you would like to have executed after a PR is submitted, where the effects of the commands are merged back into the pr
echo "The post-pr-run.sh script is executing"

## add and commit the changes made to the repo and push back into the pullrequest
git add .
git commit -m "pr$PULLNUMBER"
git push origin $CURRENT_BRANCH