#!/bin/bash
#ekremiscan

ips=(10.1.10.37 10.1.10.40 10.1.10.35 10.1.10.36 10.1.10.38 10.1.10.39 10.1.10.25 10.1.10.17 10.1.10.23 10.1.10.22 10.1.10.33 10.1.10.32 10.1.10.20 10.1.10.28 10.1.10.21 10.1.10.26 10.1.10.27 10.1.10.24 10.1.10.44 10.1.10.46 10.1.10.43 10.1.10.45 10.1.10.41 10.1.10.42 )


for ip in "${ips[@]}"; do
        ssh -T $ip << \code
ifconfig | grep addr:10 | awk -F: '{print $2}' | awk '{print $1}' > /tmp/ipnumara.txt
scp /tmp/ipnumara.txt scc:/tmp
rm -f /tmp/ipnumara.txt
ssh -T scc
ipnumara=$(cat /tmp/ipnumara.txt)
plcip=$(grep TD:4 /opt/eds/log/plc.log | tail -n 1 | awk '{print $8}')

if grep -q $plcip /opt/eds/log/bhs.log | sleep 45; then
echo
else
echo "$ipnumara IAC KARARLARINI KONTROL ET $(date +%Y-%m-%d=%H:%M:%S)"
svc -k /service/scs
ssh -T iac svc -k /service/imp
fi
rm -f /tmp/ipnumara.txt
code
done
