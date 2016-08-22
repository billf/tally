#!/bin/bash

text=`head -1 LICENSE`

ERROR_COUNT=0
while read file
do
    head -1 ${file} | grep -q "${text}"
    if [ $? -ne 0 ]; then
        echo "$file is missing license header."
        ERROR_COUNT+=1
    fi
done < <(git ls-files "\.go")

exit $ERROR_COUNT
