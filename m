From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Dropped packets logged which should be accepted by Conntrack
Date: Mon, 14 Nov 2011 22:07:28 -0500
Message-ID: <1321326448.2936.43.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, all.  I find myself perplexed by what I often see in our logs.
At the end of our FORWARD chain, we log drops for no matches:

[root@fw01 log]# iptables -v -n -L FORWARD
Chain FORWARD (policy DROP 528K packets, 85M bytes)
 pkts bytes target     prot opt in     out     source
destination
  16M  925M TCPMSS     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU
2284M 1690G ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
7890K  594M VPN_ALLOW  all  --  *      *       0.0.0.0/0
0.0.0.0/0           MARK match 0xcccc/0xcccc
  27M 2609M UPEPIN_DENY  all  --  *      *       0.0.0.0/0
0.0.0.0/0
  27M 2609M UPEPIN     all  --  *      *       0.0.0.0/0
0.0.0.0/0
 528K   85M LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           LOG flags 0 level 4 prefix `No Match: '

However, my logs are always showing these drops for packets I know
should be matched in conntrack:

Nov 14 18:45:51 fw01 kernel: No Match: IN=bond4 OUT=bond3 SRC=172.x.y.34
DST=194.187.105.194 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=48910 DF
PROTO=TCP SPT=25 DPT=60261 WINDOW=4
Nov 14 18:45:51 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=55912 WINDOW=0 RES=0
Nov 14 18:45:51 fw01 kernel: No Match: IN=bond4 OUT=bond3 SRC=172.x.y.34
DST=115.68.20.245 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=63654 DF PROTO=TCP
SPT=25 DPT=35100 WINDOW=46
Nov 14 18:45:51 fw01 kernel: No Match: IN=bond4 OUT=bond3 SRC=172.x.y.34
DST=89.31.145.16 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=58184 DF PROTO=TCP
SPT=25 DPT=6654 WINDOW=46 RE
Nov 14 18:45:51 fw01 kernel: No Match: IN=bond4 OUT=bond3 SRC=172.x.y.34
DST=206.71.61.68 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=48619 DF PROTO=TCP
SPT=25 DPT=2643 WINDOW=5840
Nov 14 18:45:51 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=34623 WINDOW=0 RES=0
Nov 14 18:45:51 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=34658 WINDOW=0 RES=0
Nov 14 18:45:51 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=34684 WINDOW=0 RES=0
Nov 14 18:45:51 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=11211 DPT=46880 WINDOW=0 RES
Nov 14 18:45:51 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=34666 WINDOW=0 RES=0
Nov 14 18:45:52 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=34657 WINDOW=0 RES=0
Nov 14 18:45:52 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=34667 WINDOW=0 RES=0
Nov 14 18:45:52 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=34636 WINDOW=0 RES=0
Nov 14 18:45:52 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=34658 WINDOW=0 RES=0
Nov 14 18:45:52 fw01 kernel: No Match: IN=bond4 OUT=bond3 SRC=172.x.y.34
DST=64.34.234.107 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=8764 DF PROTO=TCP
SPT=25 DPT=48135 WINDOW=46 R
Nov 14 18:45:52 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=34684 WINDOW=0 RES=0
Nov 14 18:45:52 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.z.73
DST=172.x.y.34 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP
SPT=389 DPT=34666 WINDOW=0 RES=0
Nov 14 18:45:52 fw01 kernel: No Match: IN=bond4 OUT=bond3 SRC=172.x.y.34
DST=94.23.2.185 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=16465 DF PROTO=TCP
SPT=25 DPT=55897 WINDOW=46 RE
Nov 14 18:45:52 fw01 kernel: No Match: IN=bond4 OUT=bond3 SRC=172.x.y.34
DST=89.31.145.16 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=58185 DF PROTO=TCP
SPT=25 DPT=6654 WINDOW=46 RE

The above shows SMTP, LDAP, and memcached replies which should have been
accepted.  Why would I see this?

I thought that the conntrack table might be overrun since there is a
very large rule set.  However,

[root@fw01 log]# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_count
534
[root@fw01 log]# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
65536
[root@fw01 log]# cat /sys/module/nf_conntrack/parameters/hashsize
16384

So it looks like we are nowhere near the max number of conntrack
entries.  So, if conntrack is not overrun, why is it not matching these
packets? Thanks - John

