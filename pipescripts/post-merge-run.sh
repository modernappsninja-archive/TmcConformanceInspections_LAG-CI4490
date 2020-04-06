#!/bin/bash

## Prepare Working Directory

### create directory for working clone used to process script updates
mkdir /workspace/pr$PULL_NUMBER
git clone $SOURCE_URL
cd $APP_NAME

## Execute commands that do not make or require changes that be merged back into the repo

### placeholder echo for this section
echo "placeholder echo for step to Execute commands that do not make or require changes that be merged back into the repo"

## Execute commands that make changes that need merging back into the source repository

### placeholder echo for this section
echo "placeholder echo for step to Execute commands that make changes that need merging back into the source repository"

## add and commit the changes made to the repo and push back into the pullrequest
git add .
git commit -m "post-merge processing for pr$PULLNUMBER"
git push origin master



