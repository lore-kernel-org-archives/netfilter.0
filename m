From: "Nestor A. Diaz" <nestor@tiendalinux.com>
Subject: Clarification on the use of the statistic module
Date: Wed, 10 Jul 2013 10:12:07 -0500
Message-ID: <51DD79C7.3080707@tiendalinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Guys.

I am using the statistics module to balance traffic coming from a
network interface into some services running on the same machine, but
distribution don't tend to be equal.

I use the following iptables script for debugging purposes, which
receives a packet and log it according to the statistic module, i also
put a default log entry in case module don't catch it.

# balance
# log prefix=`date +%Y%m%d%H%M%S`
/sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 -m
state --state NEW -m statistic --mode nth --every 2 --packet 0 -j LOG
--log-prefix 20130710095901_packet_0
/sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 -m
state --state NEW -m statistic --mode nth --every 2 --packet 0 -j ACCEPT
/sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 -m
state --state NEW -m statistic --mode nth --every 2 --packet 1 -j LOG
--log-prefix 20130710095901_packet_1
/sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 -m
state --state NEW -m statistic --mode nth --every 2 --packet 1 -j ACCEPT
# default
/sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 -m
state --state NEW -j LOG --log-prefix 20130710095901_packet_2
/sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 -m
state --state NEW -j ACCEPT

Then i run a series of netcat process to test the configuration:

for i in `seq 1 1000`; do echo test | nc 172.16.1.1 7000; done

The results are logged via syslog, then i use a script to process the
result produced:

# Example: Jul 10 09:37:10 asterix kernel: [3712376.281427]
20130710093659_packet_1 IN=eth0 OUT=
MAC=00:22:4d:56:ac:0c:00:27:0e:0e:b2:61:08:00 SRC=172.24.107.59
DST=172.24.107.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=54795 DF PROTO=TCP
SPT=35341 DPT=7000 WINDOW=14600 RES=0x00 SYN URGP=0
# count_packets.sh
#!/bin/bash

prefix=$1

for i in 0 1 2
do
    echo -n "${i}: "
    grep ${prefix}_packet_${i} /var/log/iptables.log | wc | awk '{print $1}'
done

And for 1000 packets i got exactly the following every time i run the
script (with a different log prefix off course)

./count_packets.sh 20130710093659
0: 500
1: 250
2: 250

When i was expecting the following result:

0: 500
1: 500
2: 0

What i am doing wrong ?

Thanks.

-- 
Typed on my key64.org keyboard

Nestor A Diaz

