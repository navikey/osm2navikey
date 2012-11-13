#!/bin/sh
ROOTdir=/home/osm/7w
CNTRY=setupcountry

LOG_FILE=/home/osm/7w/log/$CNTRY.log

datt=`date +%Y-%m-%d' '%H:%M`
echo $datt ": Start converting "$CNTRY >>$LOG_FILE

cd $ROOTdir
cd $CNTRY

../Converter.exe config.cfg 1>>$LOG_FILE

cd 7w
rm -f *.zip
./pack.sh >>$LOG_FILE
cd ..

datt=`date +%Y-%m-%d' '%H:%M`
echo $datt ": Finish converting "$CNTRY >>$LOG_FILE
