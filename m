From: Jordan Russell <jr-list-2007@quo.to>
Subject: Re: ICMP packets associated with NAT connections sent out wrong
	interface?
Date: Wed, 04 Jul 2007 18:25:57 -0500
Message-ID: <468C2C85.6020303@quo.to>
References: <f513uq$kvi$1@sea.gmane.org>
	<200706290100.l5T1028w016087@toshiba.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200706290100.l5T1028w016087@toshiba.co.jp>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

[re-sending without the attachment]

Yasuyuki KOZAKAI wrote:
> What is real TCP packet on wire ? Is it really from 192.168.0.4 to
> 123.23.23.23 ? If there is bug in kernel, we cannot believe
> output of LOG because NAT usually mangles addresses and ports in ICMP body.

For this logged packet:

Jul  4 14:54:33 webby kernel: [packet out wrong interface] IN= OUT=eth1
SRC=123.23.23.23 DST=192.168.0.133 LEN=68 TOS=0x00 PREC=0xC0 TTL=64
ID=39698 PROTO=ICMP TYPE=3 CODE=3 [SRC=192.168.0.133 DST=123.23.23.23
LEN=40 TOS=0x00 PREC=0x20 TTL=239 ID=39262 PROTO=TCP SPT=25000 DPT=25000
WINDOW=64172 RES=0x00 RST URGP=0 ]

the real packet on eth1 according to tcpdump seems to be:

14:54:33.931831 IP (tos 0x20, ttl 239, id 39262, offset 0, flags [none],
proto: TCP (6), length: 40) 70.243.226.250.1703 > 123.23.23.23.25000: R,
cksum 0xacb6 (correct), 4070626809:4070626809(0) win 64172

> What is your kernel configration

Full kernel config here: http://76.187.96.234/config-2.6.21.5
All settings under /proc/sys/net/netfilter are default.

> and other nat rules ?

I can see the logged packets with just the following rules:

*nat
:PREROUTING ACCEPT [32:2910]
:POSTROUTING ACCEPT [29:2330]
:OUTPUT ACCEPT [2:152]
-A PREROUTING -i eth1 -p tcp -m tcp --dport 25000 -j DNAT
--to-destination 192.168.0.133
-A PREROUTING -i eth1 -p udp -m udp --dport 25000 -j DNAT
--to-destination 192.168.0.133
-A POSTROUTING -o eth1 -j MASQUERADE
COMMIT
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth0 -j ACCEPT
-A INPUT -i eth1 -m state --state ESTABLISHED -j ACCEPT
-A INPUT -i eth1 -j REJECT --reject-with icmp-port-unreachable
-A INPUT -j DROP
-A FORWARD -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -d 192.168.0.0/255.255.255.0 -o eth0 -j ACCEPT
-A OUTPUT -d 192.168.0.0/255.255.255.0 -j LOG --log-prefix "[packet out
wrong interface] "
-A OUTPUT -o eth1 -j ACCEPT
-A OUTPUT -j DROP
COMMIT

And I've found that the problem occurs with DNAT connections too.

Steps to reproduce:

1. On the server, iptables-restore the above rules.
2. On 192.168.0.133, install BitTorrent client (e.g. Azureus) with TCP
and UDP ports set to 25000.
3. Download
<http://torrent.fedoraproject.org/torrents/Fedora-7-i386.torrent> using
the BitTorrent client.

Within 5-20 minutes, packets begin matching the LOG rule:

Jul  4 14:54:33 webby kernel: [packet out wrong interface] IN= OUT=eth1
SRC=123.23.23.23 DST=192.168.0.133 LEN=68 TOS=0x00 PREC=0xC0 TTL=64
ID=39698 PROTO=ICMP TYPE=3 CODE=3 [SRC=192.168.0.133 DST=123.23.23.23
LEN=40 TOS=0x00 PREC=0x20 TTL=239 ID=39262 PROTO=TCP SPT=25000 DPT=25000
WINDOW=64172 RES=0x00 RST URGP=0 ]
Jul  4 14:58:04 webby kernel: [packet out wrong interface] IN= OUT=eth1
SRC=123.23.23.23 DST=192.168.0.133 LEN=92 TOS=0x00 PREC=0xC0 TTL=64
ID=32353 PROTO=ICMP TYPE=3 CODE=3 [SRC=192.168.0.133 DST=123.23.23.23
LEN=64 TOS=0x00 PREC=0x20 TTL=38 ID=47850 DF PROTO=TCP SPT=25000
DPT=25000 WINDOW=63 RES=0x00 ACK URGP=0 ]
Jul  4 15:01:06 webby kernel: [packet out wrong interface] IN= OUT=eth1
SRC=123.23.23.23 DST=192.168.0.133 LEN=68 TOS=0x00 PREC=0xC0 TTL=64
ID=39699 PROTO=ICMP TYPE=3 CODE=3 [SRC=192.168.0.133 DST=123.23.23.23
LEN=40 TOS=0x00 PREC=0x20 TTL=239 ID=39688 PROTO=TCP SPT=25000 DPT=25000
WINDOW=64172 RES=0x00 RST URGP=0 ]
Jul  4 15:09:18 webby kernel: [packet out wrong interface] IN= OUT=eth1
SRC=123.23.23.23 DST=192.168.0.133 LEN=68 TOS=0x00 PREC=0xC0 TTL=64
ID=39700 PROTO=ICMP TYPE=3 CODE=3 [SRC=192.168.0.133 DST=123.23.23.23
LEN=40 TOS=0x00 PREC=0x20 TTL=239 ID=40226 PROTO=TCP SPT=25000 DPT=25000
WINDOW=64172 RES=0x00 RST URGP=0 ]
Jul  4 15:11:10 webby kernel: [packet out wrong interface] IN= OUT=eth1
SRC=123.23.23.23 DST=192.168.0.133 LEN=71 TOS=0x00 PREC=0xC0 TTL=64
ID=21127 PROTO=ICMP TYPE=3 CODE=3 [SRC=192.168.0.133 DST=123.23.23.23
LEN=43 TOS=0x00 PREC=0x20 TTL=17 ID=0 PROTO=TCP SPT=25000 DPT=25000
WINDOW=0 RES=0x00 RST URGP=0 ]

> And please try to
> 'echo 1 > /proc/sys/net/nf_conntrack_log_invalid' and see whether any
> packet is logged or not.

When I do that, some "bad HW ICMP checksum" messages are logged, e.g.:

Jul  4 14:58:39 webby kernel: nf_ct_icmp: bad HW ICMP checksum IN= OUT=
SRC=80.133.170.211 DST=123.23.23.23 LEN=119 TOS=0x00 PREC=0x20 TTL=234
ID=22079 PROTO=ICMP TYPE=3 CODE=1 [SRC=123.23.23.23 DST=80.133.170.211
LEN=91 TOS=0x00 PREC=0x00 TTL=114 ID=25502 PROTO=UDP SPT=25000 DPT=21519
LEN=71 ]

but the times don't coincide with the "[packet out wrong interface]" LOG
messages.

-- 
Jordan Russell

