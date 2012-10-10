#!/bin/sh
CNTRY=setupcountry

# скрипт скачивающий границы страны
# использует getbound.pl и aliases.yml
# для получения двубуквенного названия страны использует iso-3166-1-a2-en.txt
# возможно использование для любых границ если знаете номер relation d OSM
# для этого заменить переменную REG на номер relation перед if

TMP=`grep -i $CNTRY ./../iso-3166-1-a2-en.txt`
REG=`printf $TMP | tr A-Z a-z`

if (test -e $REG) then
  echo "No country found. please edit script and set REG to relation number of boun
else
# эта строчка скачивает границы всей страны если нам понадобится просто обрезка.
# по границам страны
  ../../cfg/getbound.pl -onering $REG >$CNTRY.poly
# Далее нам необходимо скачать границы регионов внутри страны по номерам отношений
# relation границ (boundary = administrative) обычно для страны adminlevel=2
# для региона внутри страны adminlevel=4 (для разбивки региона adminlevel=6)
# adminlevel можно увидеть в редакторе OSM в свойствах объекта - граница

#  ../../cfg/getbound.pl -onering 28322 >Mecklenburg-Vorpommern.poly
fi