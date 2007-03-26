From: Kenneth Foster <ken.foster@pleasant.net>
Subject: Seems to be a problem with Livemeeting or the use of <nop, nop,
	sack>
Date: Mon, 26 Mar 2007 10:54:23 -0700
Message-ID: <460808CF.8070600@pleasant.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

This is a recent problem.  LiveMeeting stopped working through our 
IPtables Firewall (iptables v1.3.5, Linux 2.6.16.21-0.8-smp).  Some 
packets are not getting through the firewall from a LiveMeeting 
session.  It seems that the "sack" option when given is treated as a new 
connection not a current connection. (Modules are listed at the bottom).

Asking Microsoft for help is pretty much useless.  They cannot even 
admit if something did or did not change on their software.

x.x.x.x is my outside firewall
192.168.8.239 is an inside machine that is connecting through NAT to the 
LiveMeeting site.

I have searched Google for a clue and have found no known issues that 
relate to this. 

Has anyone seen this before or have a clue to this problem?

TCPDUMP on the Outside firewall's interface
08:15:09.133048 IP (tos 0x0, ttl 241, id 53240, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > x.x.x.x.1255: ., cksum 
0x6229 (correct), ack 281407 win 16384
08:15:09.133189 IP (tos 0x0, ttl 241, id 53240, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > x.x.x.x.1255: ., cksum 
0x6229 (correct), ack 281407 win 16384
08:15:09.133642 IP (tos 0x0, ttl 127, id 17960, offset 0, flags [DF], 
proto: TCP (6), length: 319) x.x.x.x.1255 > 64.41.193.57.8009: P 
285187:285466(279) ack 2112 win 64370
08:15:09.155605 IP (tos 0x0, ttl 241, id 53858, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > x.x.x.x.1255: ., cksum 
0x5851 (correct), ack 283927 win 16384
08:15:09.158143 IP (tos 0x0, ttl 241, id 53947, offset 0, flags [DF], 
proto: TCP (6), length: 52) 64.41.193.57.8009 > x.x.x.x.1255: ., cksum 
0x3ce8 (correct), ack 283927 win 16384 <nop,nop,sack 1 
{289873807:289874086}>
08:15:09.158226 IP (tos 0x0, ttl 241, id 53962, offset 0, flags [DF], 
proto: TCP (6), length: 52) 64.41.193.57.8009 > x.x.x.x.1255: ., cksum 
0x3bd1 (correct), ack 285466 win 16384 <nop,nop,sack 1 
{289872547:289874086}>
08:15:09.164081 IP (tos 0x0, ttl 241, id 53997, offset 0, flags [DF], 
proto: TCP (6), length: 113) 64.41.193.57.8009 > x.x.x.x.1255: P 
2112:2173(61) ack 285466 win 16384 <nop,nop,sack 1 {289872547:289874086}>
08:15:09.729507 IP (tos 0x0, ttl 127, id 17961, offset 0, flags [DF], 
proto: TCP (6), length: 1300) x.x.x.x.1255 > 64.41.193.57.8009: . 
283927:285187(1260) ack 2112 win 64370
08:15:09.760595 IP (tos 0x0, ttl  97, id 17961, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > x.x.x.x.1255: P, cksum 
0x5209 (correct), ack 285466 win 16384
08:15:09.760673 IP (tos 0x0, ttl  97, id 17961, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > x.x.x.x.1255: P, cksum 
0x5209 (correct), ack 285466 win 16384
08:15:10.130890 IP (tos 0x0, ttl 127, id 17962, offset 0, flags [DF], 
proto: TCP (6), length: 1300) x.x.x.x.1255 > 64.41.193.57.8009: . 
285466:286726(1260) ack 2112 win 64370


NOTICE THAT THE FORWARDS CHANGE TO INPUT
/var/log/firewall
Mar 26 08:15:09 ate kernel: -- FORWARD IN=eth4 OUT=eth8 SRC=64.41.193.57 
DST=192.168.8.239 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=53240 DF 
PROTO=TCP SPT=8009 DPT=1255 WINDOW=16384 RES=0x00 ACK URGP=0
Mar 26 08:15:09 ate kernel: -- FORWARD IN=eth4 OUT=eth8 SRC=64.41.193.57 
DST=192.168.8.239 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=53240 DF 
PROTO=TCP SPT=8009 DPT=1255 WINDOW=16384 RES=0x00 ACK URGP=0
Mar 26 08:15:09 ate kernel: -- FORWARD IN=eth8 OUT=eth4 
SRC=192.168.8.239 DST=64.41.193.57 LEN=319 TOS=0x00 PREC=0x00 TTL=127 
ID=17960 DF PROTO=TCP SPT=1255 DPT=8009 WINDOW=64370 RES=0x00 ACK PSH URGP=0
Mar 26 08:15:09 ate kernel: -- FORWARD IN=eth4 OUT=eth8 SRC=64.41.193.57 
DST=192.168.8.239 LEN=40 TOS=0x00 PREC=0x00 TTL=240 ID=53858 DF 
PROTO=TCP SPT=8009 DPT=1255 WINDOW=16384 RES=0x00 ACK URGP=0
Mar 26 08:15:09 ate kernel: -- INPUT IN=eth4 OUT= 
MAC=00:0d:56:fe:47:e3:00:09:e8:f4:9e:80:08:00 SRC=64.41.193.57 
DST=x.x.x.x LEN=52 TOS=0x00 PREC=0x00 TTL=241 ID=53947 DF PROTO=TCP 
SPT=8009 DPT=1255 WINDOW=16384 RES=0x00 ACK URGP=0
Mar 26 08:15:09 ate kernel: -- INPUT IN=eth4 OUT= 
MAC=00:0d:56:fe:47:e3:00:09:e8:f4:9e:80:08:00 SRC=64.41.193.57 
DST=x.x.x.x LEN=52 TOS=0x00 PREC=0x00 TTL=241 ID=53962 DF PROTO=TCP 
SPT=8009 DPT=1255 WINDOW=16384 RES=0x00 ACK URGP=0
Mar 26 08:15:09 ate kernel: -- INPUT IN=eth4 OUT= 
MAC=00:0d:56:fe:47:e3:00:09:e8:f4:9e:80:08:00 SRC=64.41.193.57 
DST=x.x.x.x LEN=113 TOS=0x00 PREC=0x00 TTL=241 ID=53997 DF PROTO=TCP 
SPT=8009 DPT=1255 WINDOW=16384 RES=0x00 ACK PSH URGP=0
Mar 26 08:15:09 ate kernel: -- FORWARD IN=eth8 OUT=eth4 
SRC=192.168.8.239 DST=64.41.193.57 LEN=1300 TOS=0x00 PREC=0x00 TTL=127 
ID=17961 DF PROTO=TCP SPT=1255 DPT=8009 WINDOW=64370 RES=0x00 ACK URGP=0
Mar 26 08:15:09 ate kernel: -- FORWARD IN=eth4 OUT=eth8 SRC=64.41.193.57 
DST=192.168.8.239 LEN=40 TOS=0x00 PREC=0x00 TTL=96 ID=17961 DF PROTO=TCP 
SPT=8009 DPT=1255 WINDOW=16384 RES=0x00 ACK PSH URGP=0
Mar 26 08:15:09 ate kernel: -- FORWARD IN=eth4 OUT=eth8 SRC=64.41.193.57 
DST=192.168.8.239 LEN=40 TOS=0x00 PREC=0x00 TTL=96 ID=17961 DF PROTO=TCP 
SPT=8009 DPT=1255 WINDOW=16384 RES=0x00 ACK PSH URGP=0
Mar 26 08:15:10 ate kernel: -- FORWARD IN=eth8 OUT=eth4 
SRC=192.168.8.239 DST=64.41.193.57 LEN=1300 TOS=0x00 PREC=0x00 TTL=127 
ID=17962 DF PROTO=TCP SPT=1255 DPT=8009 WINDOW=64370 RES=0x00 ACK URGP=0

TCPDUMP on the Inside firewall's interface
08:15:09.133159 IP (tos 0x0, ttl 240, id 53240, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > 192.168.8.239.1255: ., 
cksum 0xd3fb (correct), ack 286474 win 16384
08:15:09.133249 IP (tos 0x0, ttl 240, id 53240, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > 192.168.8.239.1255: ., 
cksum 0xd3fb (correct), ack 286474 win 16384
08:15:09.133556 IP (tos 0x0, ttl 128, id 17960, offset 0, flags [DF], 
proto: TCP (6), length: 319) 192.168.8.239.1255 > 64.41.193.57.8009: P 
290254:290533(279) ack 18508 win 64370
08:15:09.155669 IP (tos 0x0, ttl 240, id 53858, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > 192.168.8.239.1255: ., 
cksum 0xca23 (correct), ack 288994 win 16384
08:15:09.729448 IP (tos 0x0, ttl 128, id 17961, offset 0, flags [DF], 
proto: TCP (6), length: 1300) 192.168.8.239.1255 > 64.41.193.57.8009: . 
288994:290254(1260) ack 18508 win 64370
08:15:09.760660 IP (tos 0x0, ttl  96, id 17961, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > 192.168.8.239.1255: P, 
cksum 0xc3db (correct), ack 290533 win 16384
08:15:09.760717 IP (tos 0x0, ttl  96, id 17961, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > 192.168.8.239.1255: P, 
cksum 0xc3db (correct), ack 290533 win 16384
08:15:10.130832 IP (tos 0x0, ttl 128, id 17962, offset 0, flags [DF], 
proto: TCP (6), length: 1300) 192.168.8.239.1255 > 64.41.193.57.8009: . 
290533:291793(1260) ack 18508 win 64370
08:15:10.130909 IP (tos 0x0, ttl 128, id 17963, offset 0, flags [DF], 
proto: TCP (6), length: 1300) 192.168.8.239.1255 > 64.41.193.57.8009: . 
291793:293053(1260) ack 18508 win 64370
08:15:10.159572 IP (tos 0x0, ttl 240, id 19562, offset 0, flags [DF], 
proto: TCP (6), length: 122) 64.41.193.57.8009 > 192.168.8.239.1255: P 
18569:18651(82) ack 293053 win 16384
08:15:10.159941 IP (tos 0x0, ttl 128, id 17964, offset 0, flags [DF], 
proto: TCP (6), length: 52) 192.168.8.239.1255 > 64.41.193.57.8009: ., 
cksum 0x87aa (correct), ack 18508 win 64370 <nop,nop,sack 1 {18569:18651}>
08:15:10.160190 IP (tos 0x0, ttl 128, id 17965, offset 0, flags [DF], 
proto: TCP (6), length: 1300) 192.168.8.239.1255 > 64.41.193.57.8009: . 
293053:294313(1260) ack 18508 win 64370
08:15:10.160259 IP (tos 0x0, ttl 128, id 17966, offset 0, flags [DF], 
proto: TCP (6), length: 1300) 192.168.8.239.1255 > 64.41.193.57.8009: . 
294313:295573(1260) ack 18508 win 64370
08:15:10.160308 IP (tos 0x0, ttl 128, id 17967, offset 0, flags [DF], 
proto: TCP (6), length: 1300) 192.168.8.239.1255 > 64.41.193.57.8009: . 
295573:296833(1260) ack 18508 win 64370
08:15:10.238307 IP (tos 0x0, ttl 240, id 22230, offset 0, flags [DF], 
proto: TCP (6), length: 40) 64.41.193.57.8009 > 192.168.8.239.1255: ., 
cksum 0xafe1 (correct), ack 295573 win 16384
08:15:10.238895 IP (tos 0x0, ttl 128, id 17968, offset 0, flags [DF], 
proto: TCP (6), length: 1300) 192.168.8.239.1255 > 64.41.193.57.8009: . 
296833:298093(1260) ack 18508 win 64370
08:15:10.238993 IP (tos 0x0, ttl 128, id 17969, offset 0, flags [DF], 
proto: TCP (6), length: 1300) 192.168.8.239.1255 > 64.41.193.57.8009: . 
298093:299353(1260) ack 18508 win 64370



/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_conntrack_netlink.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/iptable_raw.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_conntrack.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_multiport.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_nat_tftp.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_TTL.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/iptable_nat.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_TOS.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_DSCP.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_MASQUERADE.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_owner.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_SAME.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/iptable_mangle.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_iprange.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/arptable_filter.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_LOG.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_ipv4options.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_ECN.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_conntrack_amanda.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_NETMAP.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_nat_irc.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/iptable_filter.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_nat_ftp.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_nat_snmp_basic.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_nat_pptp.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_conntrack_tftp.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_REJECT.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_hashlimit.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_ttl.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_policy.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_tos.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_CLUSTERIP.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/arpt_mangle.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_TCPMSS.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_REDIRECT.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_ULOG.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_nat_amanda.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_nat.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_conntrack_proto_sctp.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_recent.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_esp.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_tables.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_queue.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/arp_tables.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_ecn.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_ah.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_conntrack_irc.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_conntrack_netbios_ns.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_conntrack_ftp.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_dscp.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ip_conntrack_pptp.ko
/lib/modules/2.6.16.21-0.8-smp/kernel/net/ipv4/netfilter/ipt_addrtype.ko

