#!/bin/bash
wget -r ftp://ftp.leg.wa.gov/Pub/RCW/RCW%20%2023B%20TITLE/
mkdir rcw
cp ftp.leg.wa.gov/Pub/RCW/RCW\ \ 23B\ TITLE/RCW*/* rcw/
rm -Rf ftp.leg.wa.gov
cd rcw
rm *CHAPTER.htm
rename "s/\s+//g" *
mv RCW23BTITLE.htm RCW23B.00.TITLE.htm
cat * > RCW23B.html
rm *.htm
cd ..
mv rcw/RCW23B.html .
rmdir rcw

