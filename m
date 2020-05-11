From: Reindl Harald <h.reindl@thelounge.net>
Subject: -m statistic does not work with 5.6.8
Date: Mon, 11 May 2020 16:58:30 +0200
Message-ID: <69c25ef3-5864-42b7-8157-08d5c749037c@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

last weekend i ported a honesypot-vm from CentOS6 to Fedora running
5.6.8 but now "-m statistic" no longer works

"telnet 8.8.8.8 80" is and was supposed to hit rules 1-6 for 6 alls but
they are always the first one

$IPTABLES -t nat -N HTTP_NAT
$IPTABLES -t nat -A HTTP_NAT -m statistic --mode nth --every 1 --packet
0 -j SNAT --to-source 10.0.0.90
$IPTABLES -t nat -A HTTP_NAT -m statistic --mode nth --every 2 --packet
0 -j SNAT --to-source 10.0.0.91
$IPTABLES -t nat -A HTTP_NAT -m statistic --mode nth --every 3 --packet
0 -j SNAT --to-source 10.0.0.92
$IPTABLES -t nat -A HTTP_NAT -m statistic --mode nth --every 4 --packet
0 -j SNAT --to-source 10.0.0.93
$IPTABLES -t nat -A HTTP_NAT -m statistic --mode nth --every 5 --packet
0 -j SNAT --to-source 10.0.0.94
$IPTABLES -t nat -A HTTP_NAT -m statistic --mode nth --every 6 --packet
0 -j SNAT --to-source 10.0.0.95
$IPTABLES -t nat -A HTTP_NAT -m statistic --mode nth --every 7 --packet
0 -j SNAT --to-source 10.0.0.96
$IPTABLES -t nat -A POSTROUTING ! -d "$LAN_RANGE" -m conntrack --ctstate
NEW -p tcp -m multiport --dports 80,443 -j HTTP_NAT

-----------------------------------------------------------------------------------------------
IPV4 TABLE NAT
-----------------------------------------------------------------------------------------------
Chain PREROUTING (policy ACCEPT 136 packets, 6704 bytes)
num   pkts bytes target     prot opt in     out     source
 destination

Chain INPUT (policy ACCEPT 110 packets, 5660 bytes)
num   pkts bytes target     prot opt in     out     source
 destination

Chain OUTPUT (policy ACCEPT 75 packets, 5342 bytes)
num   pkts bytes target     prot opt in     out     source
 destination

Chain POSTROUTING (policy ACCEPT 69 packets, 4982 bytes)
num   pkts bytes target     prot opt in     out     source
 destination
1        6   360 HTTP_NAT   tcp  --  *      *       0.0.0.0/0
!10.0.0.0/8           ctstate NEW multiport dports 80,443

Chain HTTP_NAT (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        6   360 SNAT       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            statistic mode nth every 1 to:10.0.0.90
2        0     0 SNAT       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            statistic mode nth every 2 to:10.0.0.91
3        0     0 SNAT       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            statistic mode nth every 3 to:10.0.0.92
4        0     0 SNAT       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            statistic mode nth every 4 to:10.0.0.93
5        0     0 SNAT       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            statistic mode nth every 5 to:10.0.0.94
6        0     0 SNAT       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            statistic mode nth every 6 to:10.0.0.95
7        0     0 SNAT       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            statistic mode nth every 7 to:10.0.0.96
