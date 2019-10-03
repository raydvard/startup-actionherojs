#!/bin/sh

echo "--"
echo "-- Initializing repo & pulling from git repo"
echo "--"

git init
git remote add origin https://github.com/raydvard/startup-actionherojs.git --config core.autocrlf=input
git fetch --all
git reset --hard origin/master

echo "--"
echo "-- Finished Pulling"
echo "--"

echo "--"
echo "-- Starting Node Server"
echo "--"
npm start
