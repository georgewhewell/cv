#!/usr/bin/env bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

git config user.name "georgewhewell"
git config user.email "georgerw@gmail.com"

git remote add upstream "https://$GITHUB_TOKEN@github.com/georgewhewell/cv.git"
git fetch upstream
git checkout gh-pages

rm george_whewell_cv.pdf
cp $1/george_whewell_cv.pdf ./

git add george_whewell_cv.pdf
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
