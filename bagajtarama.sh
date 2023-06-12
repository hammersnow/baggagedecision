#!/bin/bash
#ekremiscan

/home/eds_cm/eko/./bagip.sh > /home/eds_cm/eko/iackarargecici.txt

cikti=$(cat /home/eds_cm/eko/iackarargecici.txt)
if grep -q "IAC" /home/eds_cm/eko/iackarargecici.txt; then
notify-send -t 900000 -u critical "$cikti"
beep -f 2000 -l 300
beep -f 2000 -l 300
beep -f 2000 -l 300
less /home/eds_cm/eko/iackarargecici.txt | tee -a /home/eds_cm/eko/iacfaultresetlog.txt > /dev/null

fi


