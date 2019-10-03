#!/bin/sh

echo "--"
echo "-- Initializing repo & pulling from git repo"
echo "--"

git init
git remote add origin https://github.com/raydvard/startup-actionherojs.git
git fetch --all
git reset --hard origin/master

echo "--"
echo "-- Finished Pulling"
echo "--"
