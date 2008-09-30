From: Brent Clark <brentgclarklist@gmail.com>
Subject: multipath kinda workiing, but tcpdump suggests otherwise
Date: Tue, 30 Sep 2008 12:34:53 +0200
Message-ID: <48E200CD.3080505@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

Hi

Im trying to get multipath routing, so that a connection to my openvpn 
(sits on router / fw). Can enter as well as leave the ISP that it came in.

Below is my workings as well as the relavent log.

        $IPT -t mangle -A PREROUTING -i eth2 -p udp -j MARK --set-mark 0x2
        $IPT -t mangle -A PREROUTING -i eth2 -p udp -j CONNMARK --save-mark
        $IPT -t mangle -A PREROUTING -s $LAPTOP -j LOG --log-prefix 
"[PRER_MANGLE]: "

Sep 30 12:08:56 cptgate kernel: [755598.816009] [PRER_MANGLE]: IN=eth2 
OUT= MAC=00:50:ba:be:21:30:00:1d:7e:aa:22:4a:08:00 SRC=41.4.71.213 
DST=192.168.10.101 LEN=42 TOS=0x00 PREC=0x00 TTL=120 ID=42547 PROTO=UDP 
SPT=1323 DPT=1194 LEN=22 MARK=0x2

        $IPT -t mangle -A INPUT -i eth2 -p udp -j MARK --set-mark 0x2
        $IPT -t mangle -A INPUT -i eth2 -p udp -j CONNMARK --save-mark
        $IPT -t mangle -A INPUT -s $LAPTOP -j LOG --log-prefix 
"[I_MANGLE]: "

Sep 30 12:08:57 gate kernel: [755599.774064] [I_MANGLE]: IN=eth2 OUT= 
MAC=00:50:ba:be:21:30:00:1d:7e:aa:22:4a:08:00 SRC=41.4.71.213 
DST=192.168.10.101 LEN=42 TOS=0x00 PREC=0x00 TTL=120 ID=42548 PROTO=UDP 
SPT=1323 DPT=1194 LEN=22 MARK=0x2

        $IPT -t mangle -A OUTPUT -p udp --sport 1194 -j MARK --set-mark 0x2
        $IPT -t mangle -A OUTPUT -p udp --sport 1194 -j CONNMARK --save-mark
        $IPT -t mangle -A OUTPUT -p udp -d $LAPTOP -j LOG --log-prefix 
"[O_MANGLE]: "
Sep 30 12:09:00 cptgate kernel: [755602.324518] [O_MANGLE]: IN= OUT=eth0 
SRC=196.36.10.114 DST=41.4.71.213 LEN=42 TOS=0x00 PREC=0x00 TTL=64 ID=0 
DF PROTO=UDP SPT=1194 DPT=1323 LEN=22 MARK=0x2

        $IPT -A POSTROUTING -t mangle -p udp -d $LAPTOP -j LOG 
--log-prefix "[POSTR_MANGLE]: "

Sep 30 12:09:00 cptgate kernel: [755602.324693] [POSTR_MANGLE]: IN= 
OUT=eth2 SRC=196.36.10.114 DST=41.4.71.213 LEN=42 TOS=0x00 PREC=0x00 
TTL=64 ID=0 DF PROTO=UDP SPT=1194 DPT=1323 LEN=22 MARK=0x2

        $IPT -t nat -A POSTROUTING -o eth0 -s $INTERNAL_MASK -j SNAT 
--to $SNAT1ADDRESS
        $IPT -t nat -A POSTROUTING -o eth2 -d $LAPTOP -j LOG 
--log-prefix "[PRE NAT]: "
        $IPT -t nat -A POSTROUTING -o eth2 -j SNAT --to $SNAT2ADDRESS
        $IPT -t nat -A POSTROUTING -p udp --sport 1194 -j LOG 
--log-prefix "[POST NAT]: "

Sep 30 12:23:58 cptgate kernel: [756500.448344] [PRE NAT]: IN= OUT=eth2 
SRC=196.36.10.114 DST=41.4.71.213 LEN=54 TOS=0x00 PREC=0x00 TTL=64 ID=0 
DF PROTO=UDP SPT=1194 DPT=1343 LEN=34 MARK=0x2

Heres the part I cant understand

with

root@cptgate:/root# tcpdump -i eth2 port 1194
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth2, link-type EN10MB (Ethernet), capture size 96 bytes
12:30:17.090895 IP 41.4.71.213.1349 > 192.168.10.101.openvpn: UDP, length 14
12:30:19.556264 IP 41.4.71.213.1349 > 192.168.10.101.openvpn: UDP, length 14
12:30:20.752803 IP 41.4.71.213.1349 > 192.168.10.101.openvpn: UDP, length 14
12:30:23.093120 IP 41.4.71.213.1349 > 192.168.10.101.openvpn: UDP, length 14

Its just one way traffic

*BUT*

if i run

root@cptgate:/root# tcpdump -n -i eth2 | grep "41.4.71.213"
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth2, link-type EN10MB (Ethernet), capture size 96 bytes
12:31:59.194900 IP 192.168.10.101.1031 > 41.4.71.213.1350: UDP, length 14
12:31:59.522035 IP 41.4.71.213.1350 > 192.168.10.101.1194: UDP, length 14
12:32:01.741988 IP 41.4.71.213.1350 > 192.168.10.101.1194: UDP, length 14
12:32:01.743000 IP 192.168.10.101.1031 > 41.4.71.213.1350: UDP, length 14
12:32:04.058917 IP 41.4.71.213.1350 > 192.168.10.101.1194: UDP, length 14
12:32:04.059921 IP 192.168.10.101.1031 > 41.4.71.213.1350: UDP, length 14
12:32:06.146476 IP 192.168.10.101.1031 > 41.4.71.213.1350: UDP, length 14
12:32:06.525866 IP 41.4.71.213.1350 > 192.168.10.101.1194: UDP, length 14
12:32:08.614499 IP 192.168.10.101.1031 > 41.4.71.213.1350: UDP, length 14
12:32:09.016984 IP 41.4.71.213.1350 > 192.168.10.101.1194: UDP, length 14
12:32:10.062674 IP 192.168.10.101.1031 > 41.4.71.213.1350: UDP, length 14

Regards
Brent
