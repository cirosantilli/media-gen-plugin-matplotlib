#!/usr/bin/env bash

#create necessary outide this repo so that main repo can use this subrepo

set -u # error on undefined variable
set -e # stop execution if one command returns != 0

BNAME="$( basename "$( pwd )" )"
cd ..

fs=( makefile shared.py )
for f in "${fs[@]}"; do
    if [ -e "$f" ]; then
        echo "FILE ALREADY EXISTS. INSTALLATION ABORTED: $f"
        exit 1
    fi
done

cp -r "in" ..
cp params.py ..
for b in makefile shared.py; do
    ln -s "$BNAME"/"$b" "$b"
done

echo 'INSTALLATION FINISHED. CONSIDER ADDING GENERATED FILES TO PROJECT WITH: `git add`'
exit 0
