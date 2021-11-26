#! /bin/bash

currBranch=$(eval "git rev-parse --abbrev-ref HEAD")
eval "git checkout master"
eval "git pull"
eval "git checkout $currBranch"
eval "git rebase master"

