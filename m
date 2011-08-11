From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Conntrack not matching properly - producing serious outages
Date: Thu, 11 Aug 2011 05:46:15 -0400
Message-ID: <1313055975.3628.56.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, all.  We have been having a subtle problem with conntrack for
quite a long time but it has suddenly gotten much worse.  Packets are
being matched as INVALID when we would expect them to be ESTABLISHED.
We are running on kernel 2.6.30.5 on X86_64 with CentOS 5.4 and
iptables-1.3.5-5.3.el5_4.1.  This has escalated from a minor annoyance
that we were going to investigate to provoking serious outages and all
hands to the pump.

The conntrack table is not swamped although we did increase the max
count and the hashsize just in case to no avail:
[root@fw01 netfilter]# cat ip_conntrack_max
65536
[root@fw01 netfilter]# cat ip_conntrack_count
532


Here are three specific examples.  The first is from the FORWARD chain.
Here are the logging messages:


Aug 11 03:29:19 fw01 kernel: FORWARD INVALID IN=bond1 OUT=bond4
SRC=172.x.y.73 DST=172.x.z.34 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=32940
DF PROTO=TCP SPT=8080 DPT=52999 WINDOW=34 RES=0x00 ACK FIN URGP=0

Aug 11 03:29:19 fw01 kernel: No Match: IN=bond1 OUT=bond4 SRC=172.x.y.73
DST=172.x.z.34 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=32940 DF PROTO=TCP
SPT=8080 DPT=52999 WINDOW=34 RES=0x00 ACK FIN URGP=0

The above is a reply packet in response to 172.x.z.34 sending a packet
to 172.x.y.73 on TCP port 8080.
The iptables sequence for the initiating packet is:
Chain INPUT (policy DROP 488 packets, 45215 bytes)
 pkts bytes target     prot opt in     out     source               destination
 175K   26M ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
   56  5924 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           state INVALID LOG flags 0 level 4 prefix `INPUT INVALID '
    4   234 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
  344 20692 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:9xxx state NEW
    8  4376 ACCEPT     esp  --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0           udp dpt:500
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0           udp dpt:4500
  420 31920 VPN_ALLOW  all  --  *      *       0.0.0.0/0            0.0.0.0/0           MARK match 0xcccc/0xcccc
 1181  113K UPEPIN_DENY  all  --  *      *       0.0.0.0/0            0.0.0.0/0
 1181  113K UPEPIN     all  --  *      *       0.0.0.0/0            0.0.0.0/0
  488 45215 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 prefix `No Match: '

It should find a match in UPEPIN where it will hit the ACESS_GROUPS
rule:
Chain UPEPIN (2 references)
 pkts bytes target     prot opt in     out     source               destination
67188 9977K ProtectionFilterSource  all  --  *      *       0.0.0.0/0            0.0.0.0/0
21302 1311K ProtectionFilterTCP  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0
16218 1235K ProtectionFilterICMP  icmp --  *      *       0.0.0.0/0            0.0.0.0/0
67188 9977K ACCESS_GROUPS  all  --  *      *       0.0.0.0/0            0.0.0.0/0

Inside ACCESS_GROUPS, it will match and jump to chain c52:
Chain ACCESS_GROUPS (3 references)
 pkts bytes target     prot opt in     out     source               destination
2549  798K c52        all  --  *      *       172.x.z.34          0.0.0.0/0

c52 jumps it to chain c29:
Chain c52 (6 references)
 pkts bytes target     prot opt in     out     source               destination
 4991 1598K c29        all  --  *      *       0.0.0.0/0            0.0.0.0/0
  313 49263 c47        all  --  *      *       0.0.0.0/0            0.0.0.0/0

where it finds a match
 pkts bytes target     prot opt in     out     source               destination
  142  8512 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           destination IP range 172.x.y.72-172.x.y.73 tcp dpt:8080

So why is the reply packet INVALID instead of ESTABLISHED? How can we
troubleshoot?

The following two examples on the INPUT chain should not even be on the
INPUT chain as NAT should be translating the addresses and placing the
packet in the FORWARD chain:

Aug 11 04:13:58 fw01 kernel: INPUT INVALID IN=bond3 OUT=
MAC=00:15:17:90:3c:0b:00:1c:58:ea:79:ff:08:00 SRC=95.172.228.42
DST=208.a.b.8 LEN=260 TOS=0x00 PREC=0x00 TTL=52 ID=54331 DF PROTO=TCP
SPT=23012 DPT=441 WINDOW=1126 RES=0x00 ACK PSH URGP=0
Aug 11 04:13:58 fw01 kernel: No Match: IN=bond3 OUT=
MAC=00:15:17:90:3c:0b:00:1c:58:ea:79:ff:08:00 SRC=95.172.228.42
DST=208.a.b.8 LEN=260 TOS=0x00 PREC=0x00 TTL=52 ID=54331 DF PROTO=TCP
SPT=23012 DPT=441 WINDOW=1126 RES=0x00 ACK PSH URGP=0


Aug 10 19:12:19 fw01 kernel: INPUT INVALID IN=bond3 OUT=
MAC=00:15:17:90:3c:0b:00:1c:58:ea:79:ff:08:00 SRC=74.75.231.235
DST=208.a.b.8 LEN=52 TOS=0x00 PREC=0x00 TTL=47 ID=12470 DF PROTO=TCP
SPT=47233 DPT=443 WINDOW=1716 RES=0x00 ACK FIN URGP=0
Aug 10 19:12:19 fw01 kernel: No Match: IN=bond3 OUT=
MAC=00:15:17:90:3c:0b:00:1c:58:ea:79:ff:08:00 SRC=74.75.231.235
DST=208.a.b.8 LEN=52 TOS=0x00 PREC=0x00 TTL=47 ID=12470 DF PROTO=TCP
SPT=47233 DPT=443 WINDOW=1716 RES=0x00 ACK FIN URGP=0

Here is the iptables sequence:
Chain PREROUTING (policy ACCEPT 58761 packets, 4122K bytes)
 pkts bytes target     prot opt in     out     source               destination
59417 4161K ServiceDNAT  all  --  *      *       0.0.0.0/0            0.0.0.0/0
59337 4156K NetNATPRE  all  --  *      *       0.0.0.0/0            0.0.0.0/0

They should hit the ServiceDNAT chain:
Chain ServiceDNAT (1 references)
 pkts bytes target     prot opt in     out     source               destination
60414 4233K ProxyDNAT  all  --  *      *       0.0.0.0/0            0.0.0.0/0
    6   360 DNAT       tcp  --  bond3  *       0.0.0.0/0            208.a.b.8         tcp dpt:441 to:172.c.d.3:9xxx
    5   372 DNAT       tcp  --  bond3  *       0.0.0.0/0            208.a.b.8         tcp dpt:443 to:172.c.d.1:9xxx

So why are we seeing these packets on the INPUT chain? They should be
picked up by CONNTRACK, translated, and then placed on the FORWARD
chain.  Is this typical of a misconfiguration on our part? A bug? How do
we troubleshoot it? Thanks very much - John



