# Scripts and configs to convert OSM to Navikey Seven Ways
# 
#

Requirements:
1) 7zip 
2) Subversion
4) Perl with necessary modules (see osm2mp page)
3) osm2mp.pl in ./cfg folder  (svn co http://osm2mp.googlecode.com/svn/trunk) 
5) getbound.pl in ./cfg folder (svn co http://osm-getbound.googlecode.com/svn/trunk/)
6) in some ways - Navikey Map Splitter (http://www.navikey.ru)
7) converter to Navikey Seven Ways in 7w

Quick guide

All scripts is tune for root as /home/osm user.
You need to change all matches for your own path.

1) Make 7w folder in your home root directory.
2) Copy all from trunk into 7w
3) Make new folder with country name or map you need convert
4) Copy from template to new folder
5) Edit prep.sh and change 2-nd row "setupcountry" to name of your contry folder you already maked
6) run prep.sh
7) Find urls with osm.bz2 that contains country you need
8) put it into urls file in osm folder
9) find urls for poly files and put it into urls file in ./poly folder (the names is equaly as name before dot in osm file)
10) if you not need to cut maps - you may remove --bpoly from osm2navikey.sh script
11) first you need to get poly (run this process from ./poly folder)
12) second - you'l try to start ./sm/get.sh
13) if all correct after work you'l see result in ./7w folder

 

