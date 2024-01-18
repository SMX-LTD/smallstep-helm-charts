#!/bin/bash

echo Ensuring were using the correct branch
git checkout gh-pages
echo Merging from master
git pull origin master

echo Building packages
helm package step-certificates
helm package step-issuer
helm package autocert

echo Building index
helm repo index `pwd` --url https://smx-ltd.github.io/smallstep-helm-charts/

echo Sending up to github
git add .
git commit -m "Build repository"
git push

echo Repo site will now automatically deploy

echo Switch back to master branch
git checkout master
exit 0
