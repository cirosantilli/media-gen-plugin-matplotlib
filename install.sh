#!/usr/bin/env bash

#create necessary outide this repo so that main repo can use this subrepo

set -u # error on undefined variable
set -e # stop execution if one command returns != 0

BNAME="$( basename "$( pwd )" )"
cp -r "in" ..
cp params.py ..
cd ..
for b in makefile shared.py; do
    ln -s "$BNAME"/"$b" "$b"
    echo "ADDED SYMLINK: $b"
done
