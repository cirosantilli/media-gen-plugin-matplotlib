#!/usr/bin/env bash

#create necessary outide this repo so that main repo can use this subrepo

set -u # error on undefined variable
set -e # stop execution if one command returns != 0

BNAME="$( basename "$( pwd )" )"

#shared files that will be linked from main repo into the subrepo:
FS_LN=( makefile .gitignore shared.py )

#templates that will be copied into parent dir:
FS_CP=( in makefile-local params.py )

for F in "${FS_LN[@]}" "${FS_CP[@]}"; do
    if [ -e ../"$F" ]; then
        echo "FILE ALREADY EXISTS. INSTALLATION ABORTED: $F"
        exit 1
    fi
done

for F in "${FS_CP[@]}"; do
    cp -r "$F" ..
done

cd ..
for B in "${FS_LN[@]}"; do
    ln -s "$BNAME"/"$B" "$B"
done

echo 'INSTALLATION FINISHED. CONSIDER ADDING GENERATED FILES TO PROJECT WITH: `git add`'
exit 0
