#!/bin/sh
CNTR=setupcountry
FILES='./splitit.sh ./poly/getpoly.sh ./7w/pack.sh ./7w/store.lst ./osm/get.sh ./poly/get.sh 27w.sh config.cfg osm2navikey.sh';

for file in $FILES; do \
  if (test -s $file); then \
    sed -e s/setupcountry/$CNTR/g ./$file >> ./$file.1
    mv -f ./$file.1 ./$file
  fi
chmod 777 ./7w/pack.sh ./osm/get.sh ./poly/get.sh 27w.sh osm2navikey.sh ./splitit.sh ./poly/getpoly.sh
done
