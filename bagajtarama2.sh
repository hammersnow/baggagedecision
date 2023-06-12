#!/bin/bash
#ekremiscan

/home/eds_cm/eko/./bagip2.sh > /home/eds_cm/eko/iackarargecici2.txt

cikti=$(cat /home/eds_cm/eko/iackarargecici2.txt)
if grep -q "IAC" /home/eds_cm/eko/iackarargecici2.txt; then
notify-send -t 900000 -u critical "$cikti"
beep -f 2000 -l 300
beep -f 2000 -l 300
beep -f 2000 -l 300
less /home/eds_cm/eko/iackarargecici2.txt | tee -a /home/eds_cm/eko/iacfaultresetlog2.txt > /dev/null

rm -f /home/eds_cm/eko/iackarargecici2.txt

fi
