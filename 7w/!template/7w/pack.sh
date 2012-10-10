#!/bin/sh
set -eu                # Always put this in Bourne shell scripts
IFS="`printf '\n\t'`"  # Always put this in Bourne shell scripts

CNTRY=setupcountry

cd /home/osm/7w/$CNTRY/7w

FILES=`find *.7w -print |
  while read -r file ; do
      echo "$file"
  done`

i=1

for file in $FILES; do \
  if (test -s $file); then \
    echo "Good: " $file;
    7z a ${file%.*}.zip $file;
  else
    echo "Error in file: " $file;
    i=0
  fi
done

## Если были плохие файлы то не паковать общий архив
if (test $i -gt 0) then \
  7z a $CNTRY.zip *.7w *.dat
else 
  echo "Not update all country with errors";
fi
