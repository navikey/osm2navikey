#!/bin/sh
# Первый вариант - основан на том что мы получаем по ссылкам osm.bz2 и poly файлы
# для выбранной страны.
# Второй вариант основан на том что мы сами режем страну на куски по границам
# полученным из OSM с помощью getpoly.sh (необходимо знать relations всех 
# необходимых границ)

CNTRY=setupcountry
ROOTdir=/home/osm/7w

LOCKFILE=/tmp/setupcountry.pid
STOPIT=0

if (test -s $LOCKFILE) then
    echo "Lock file found..."
    STOPIT=1
    PID=`cat $LOCKFILE`
    CTRL=`ps ax -p $PID -o pid | grep $PID`
    if (test -e $CTRL) then
      echo "PID dosn't present..."
      STOPIT=0
      rm $LOCKFILE;
      echo $$ > $LOCKFILE
    fi
else.
    echo $$ > $LOCKFILE
    STOPIT=0
fi

if (test $STOPIT -gt 0) then
 echo "Stop Script"
 exit
fi

BASE=$CNTRY

cd $ROOTdir
cd $BASE/osm

LOG_FILE=$ROOTdir/log/$CNTRY.log

# закоментировать решеткой нижнюю строку чтобы воспользоваться вторым вариантом
rm -f *.bz2 > $LOG_FILE
# раскоментировать строчку ниже чтобы воспользоваться вторым вариантом
#rm -f *.pbf > $LOG_FILE
wget -i urls  >> $LOG_FILE
# закоментировать решеткой нижнюю строку чтобы воспользоваться вторым вариантом
bunzip2 -f *.bz2  1>> $LOG_FILE

# раскоментировать строчку ниже чтобы воспользоваться вторым вариантом
# ../splitit.sh >$LOG_FILE

$ROOTdir/$BASE/osm2navikey.sh  >> $LOG_FILE

cd $ROOTdir
cd $BASE/osm
rm -f *.osm > $LOG_FILE

../27w.sh

rm -f $LOCKFILE