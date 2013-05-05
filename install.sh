#!/usr/bin/env bash

#create necessary outide this repo so that main repo can use this subrepo

set -u # error on undefined variable
set -e # stop execution if one command returns != 0

cp -r "in" ..
cp params.py ..
cd ..
BNAME="$( basename "$( pwd )" )"
for b in makefile shared.py; do
    ln -s "$BNAME"/"$b" "$b"
    git add "$b"
done
