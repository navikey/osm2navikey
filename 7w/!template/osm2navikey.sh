#/bin/sh
set -eu                # Always put this in Bourne shell scripts
IFS="`printf '\n\t'`"  # Always put this in Bourne shell scripts

NAME_C=setupcountry
ROOTdir=/home/osm/7w

cd $ROOTdir
cd $NAME_C

cd osm
FILES=`find *.osm -print |
  while read -r file ; do
      echo "$file"
  done`
cd ..

# Ищем коды страны и региона
TMP=`grep -i $NAME_C ./iso-3166-2.csv`
# Регион
REG=`printf $TMP | awk '{ printf $4 }'`
# Страна
CNR=`printf $TMP | awk '{ printf $2 }'`

for file in $FILES; do \
  if (test -s osm/$file); then \
    echo "Good: " $file;
     ../../cfg/osm2mp.pl --bpoly=poly/${file%.*}.poly --defaultcountry=$CNR --defaultregion=$REG --config=../../cfg/Navikey-en.cfg osm/$file > mp-navikey/${file%.*}.mp
  else
    echo "Error in file: " $file;
  fi
done
