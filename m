From: Rich Rauenzahn <rrauenza@gmail.com>
Subject: Connection tracking/iptables problem
Date: Fri, 6 Mar 2009 11:50:19 -0800
Message-ID: <657cbef50903061150k21994320v67bf9aea3622e6f0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=oYjmdTdvJNCsjvKtBBp/rR/nNSbsdlrSqIA8RvYMWSs=;
        b=eEZnWRwsZMAWFoErrNoKReeOfYU7MhSSO3xmpwXP0rLLFfS4cW0i8hgTFqTrfyed+c
         r9CIUBAPXTwClLFkpi/B1yUqoiRihY5pc95NLUxD3FVgF5wKczoj0JVNDpgXAe0DBhE0
         XMHGL2qh2W8kROY0QNPoGLKz9V9e83wT8Ln+c=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

(If this is the wrong list for this, please let me know!)

This problem showed up with my FC10 box (2.6.27.19-170.2.35.fc10.i686
#1 SMP Mon Feb 23 13:21:22 EST 2009 i686 athlon i386 GNU/Linux)
failing to send emails through easydns's smtp relay that I use for all
outbound email via TLS authentication. =A0After the authentication, and
only with binary attachments or large emails (not sure which is
required), the connection hangs to their SMTP server.  Small emails
work.   This fails on both port 587 and 20025.  (My firewall blocks
25, as does my ISP)

Sometime during the SMTP conversation (after authentication while it
is sending the body), the connection is no longer considered
established.

I added a log entry before and after my ACCEPT statement...

LOG       tcp  --  any    any     anywhere             anywhere
    tcp spt:20025 state RELATED,ESTABLISHED LOG level warning prefix
`20025 established'
ACCEPT all  --  any    any     anywhere         anywhere
state RELATED,ESTABLISHED
LOG       tcp  --  any    any     anywhere             anywhere
    tcp spt:20025 LOG level warning prefix `20025 not established'

 and get the following during the transfer:

20025 established:     IN=3Deth0 OUT=3D
MAC=3D00:18:e7:16:c6:02:00:01:5c:31:e4:41:08:00 SRC=3D205.210.42.66
DST=3D**************
LEN=3D52 TOS=3D0x00 PREC=3D0x20 TTL=3D49 ID=3D34104 DF PROTO=3DTCP SPT=3D=
20025
DPT=3D39436 WINDOW=3D7041 RES=3D0x00 ACK URGP=3D0

20025 established:     IN=3Deth0 OUT=3D
MAC=3D00:18:e7:16:c6:02:00:01:5c:31:e4:41:08:00 SRC=3D205.210.42.66
DST=3D**************
LEN=3D52 TOS=3D0x00 PREC=3D0x20 TTL=3D49 ID=3D34105 DF PROTO=3DTCP SPT=3D=
20025
DPT=3D39436 WINDOW=3D7131 RES=3D0x00 ACK URGP=3D0

20025 NOT established: IN=3Deth0 OUT=3D
MAC=3D00:18:e7:16:c6:02:00:01:5c:31:e4:41:08:00 SRC=3D205.210.42.66
DST=3D**************
LEN=3D64 TOS=3D0x00 PREC=3D0x20 TTL=3D49 ID=3D34106 DF PROTO=3DTCP SPT=3D=
20025
DPT=3D39436 WINDOW=3D7131 RES=3D0x00 ACK URGP=3D0

REJECTING:             IN=3Deth0 OUT=3D
MAC=3D00:18:e7:16:c6:02:00:01:5c:31:e4:41:08:00 SRC=3D205.210.42.66
DST=3D**************
LEN=3D64 TOS=3D0x00 PREC=3D0x20 TTL=3D49 ID=3D34106 DF PROTO=3DTCP SPT=3D=
20025
DPT=3D39436 WINDOW=3D7131 RES=3D0x00 ACK URGP=3D0

My firewall looks like this -- I'll try to keep it brief:

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
target     prot opt in     out     source               destination
BOGON_FIREWALL  all  --  any    any     anywhere             anywhere
RJR_FIREWALL  all  --  any    any     anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:13=
7
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:13=
9
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:13=
8
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:13=
7
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:13=
9
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:13=
8
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
dpt:25 LOG flags 0 level 4 prefix `Dropping outgoing SMTP: '
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:25

Chain BOGON_FIREWALL (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DROP       all  --  eth0   any     default/8
anywhere
    0     0 DROP       all  --  eth0   any     1.0.0.0/8
anywhere
    0     0 DROP       all  --  eth0   any     2.0.0.0/8
anywhere
[...]

Chain RJR_FIREWALL (2 references)
target     prot opt in     out     source               destination
ACCEPT     all  --  lo     any     anywhere             anywhere
ACCEPT     all  --  eth1   any     anywhere             anywhere
ACCEPT     icmp --  any    any     anywhere             anywhere
     icmp any
ACCEPT     all  --  any    any     anywhere             anywhere
     state RELATED,ESTABLISHED
[more rules allowing ssh whitelist, http, etc.]
LOG        tcp  --  any    any     anywhere             anywhere
     limit: avg 1/sec burst 5 LOG level warning prefix `REJECTING: '
REJECT     all  --  any    any     anywhere             anywhere
     reject-with icmp-host-prohibited

I found something similar happening at :
http://www.mail-archive.com/shorewall-users@lists.sourceforge.net/msg03=
055.html

So I ran conntrack -E for the destination host ...

[root@tendo ~]# conntrack -E -d 205.210.42.66
[NEW] tcp      6 120 SYN_SENT src=3D****** dst=3D205.210.42.66 sport=3D=
33636
dport=3D20025 [UNREPLIED] src=3D205.210.42.66 dst=3D****** sport=3D2002=
5
dport=3D33636
[UPDATE] tcp      6 60 SYN_RECV src=3D****** dst=3D205.210.42.66
sport=3D33636 dport=3D20025 src=3D205.210.42.66 dst=3D****** sport=3D20=
025
dport=3D33636
[UPDATE] tcp      6 432000 ESTABLISHED src=3D****** dst=3D205.210.42.66
sport=3D33636 dport=3D20025 src=3D205.210.42.66 dst=3D****** sport=3D20=
025
dport=3D33636 [ASSURED]
(and here it hangs....)

Is that UNREPLIED relevant?  I seem to get them on my internal network
(unrelated traffic), so I'm guessing not:

[NEW] tcp      6 120 SYN_SENT src=3D192.168.100.193 dst=3D192.168.100.1
sport=3D4017 dport=3D445 [UNREPLIED] src=3D192.168.100.1 dst=3D192.168.=
100.193
sport=3D445 dport=3D4017

Here's some tcpdump -- my IP is redacted

{1658971599:1658972967}{1658967495:1658970231}>
10:18:40.722966 IP (tos 0x20, ttl 49, id 47607, offset 0, flags [DF],
proto TCP (6), length 80) 205.210.42.66.20025 >
********.43026: ., cksum 0xcc01 (correct), ack 439804 win 8037
<nop,nop,timestamp 1102738292 63641796,nop,nop,sack 3
{1658989383:1658993487}{1658971599:1658972967}{1658967495:1658970231}>
10:18:40.727988 IP (tos 0x20, ttl 49, id 47608, offset 0, flags [DF],
proto TCP (6), length 80) 205.210.42.66.20025 >
********.43026: ., cksum 0xe637 (correct), ack 439804 win 8037
<nop,nop,timestamp 1102738293 63641796,nop,nop,sack 3
{1658997591:1658998959}{1658989383:1658993487}{1658971599:1658972967}>
10:18:40.742704 IP (tos 0x20, ttl 49, id 47609, offset 0, flags [DF],
proto TCP (6), length 80) 205.210.42.66.20025 >
********.43026: ., cksum 0xe0dd (correct), ack 439804 win 8037
<nop,nop,timestamp 1102738295 63641796,nop,nop,sack 3
{1658997591:1659000327}{1658989383:1658993487}{1658971599:1658972967}>
10:18:40.858908 IP (tos 0x0, ttl 64, id 38758, offset 0, flags [DF],
proto TCP (6), length 1420) ********.43026 >
205.210.42.66.20025: . 439804:441172(1368) ack 1969 win 193
<nop,nop,timestamp 63643709 1102738199>
10:18:40.943809 IP (tos 0x20, ttl 49, id 47610, offset 0, flags [DF],
proto TCP (6), length 80) 205.210.42.66.20025 >
********.43026: ., cksum 0xbf6e (correct), ack 446644 win 7823
<nop,nop,timestamp 1102738315 63643709,nop,nop,sack 3
{1658997591:1659000327}{1658989383:1658993487}{1658971599:1658972967}>
10:18:40.944451 IP (tos 0xc0, ttl 64, id 46984, offset 0, flags
[none], proto ICMP (1), length 108) ******** >
205.210.42.66: ICMP host ******** unreachable - admin prohibited, lengt=
h 88
        IP (tos 0x20, ttl 49, id 47610, offset 0, flags [DF], proto
TCP (6), length 80) 205.210.42.66.20025 >
********.43026: . ack 446644 win 7823 <nop,nop,timestamp 1102738315
63643709,nop,nop,[|tcp]>
10:18:43.002909 IP (tos 0x0, ttl 64, id 38759, offset 0, flags [DF],
proto TCP (6), length 1420) ********.43026 >
205.210.42.66.20025: . 439804:441172(1368) ack 1969 win 193
<nop,nop,timestamp 63645853 1102738199>
10:18:43.086907 IP (tos 0x20, ttl 36, id 38759, offset 0, flags [DF],
proto TCP (6), length 40) 205.210.42.66.20025 >
********.43026: P, cksum 0xa83c (correct), ack 446644 win 7823
10:18:43.087278 IP (tos 0x0, ttl 64, id 38760, offset 0, flags [DF],
proto TCP (6), length 2788) ********.43026 >
205.210.42.66.20025: . 692884:695620(2736) ack 1969 win 193
<nop,nop,timestamp 63645937 1102738199>
10:18:43.173519 IP (tos 0x20, ttl 49, id 47611, offset 0, flags [DF],
proto TCP (6), length 80) 205.210.42.66.20025 >
********.43026: ., cksum 0xb35e (correct), ack 446644 win 7823
<nop,nop,timestamp 1102738538 63643709,nop,nop,sack 3
{1659005799:1659007167}{1658997591:1659000327}{1658989383:1658993487}>
10:18:43.174175 IP (tos 0xc0, ttl 64, id 46985, offset 0, flags
[none], proto ICMP (1), length 108) ******** >
205.210.42.66: ICMP host ******** unreachable - admin prohibited, lengt=
h 88
        IP (tos 0x20, ttl 49, id 47611, offset 0, flags [DF], proto
TCP (6), length 80) 205.210.42.66.20025 >
********.43026: . ack 446644 win 7823 <nop,nop,timestamp 1102738538
63643709,nop,nop,[|tcp]>
10:18:43.178785 IP (tos 0x20, ttl 49, id 47612, offset 0, flags [DF],
proto TCP (6), length 80) 205.210.42.66.20025 >
********.43026: ., cksum 0xae06 (correct), ack 446644 win 7823
<nop,nop,timestamp 1102738538 63643709,nop,nop,sack 3
{1659005799:1659008535}{1658997591:1659000327}{1658989383:1658993487}>
10:18:43.179413 IP (tos 0xc0, ttl 64, id 46986, offset 0, flags
[none], proto ICMP (1), length 108) ******** >
205.210.42.66: ICMP host ******** unreachable - admin prohibited, lengt=
h 88
        IP (tos 0x20, ttl 49, id 47612, offset 0, flags [DF], proto
TCP (6), length 80) 205.210.42.66.20025 >
********.43026: . ack 446644 win 7823 <nop,nop,timestamp 1102738538
63643709,nop,nop,[|tcp]>

Any ideas?

Rich
