From: Daniel Rycaj <daniel@rycaj.net>
Subject: linux, kernel 2.6.10, vlans and IPsec problem
Date: Thu, 10 Feb 2005 12:14:54 +0100
Message-ID: <1539675452.20050210121454@rycaj.net>
Reply-To: Daniel Rycaj <daniel@rycaj.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi all,

details:
linux fedora 3 (kernel compiled from official sources)
iptables 1.2.11 (compiled from sources too)
vlan support turned on (vconfig from cvs)

I have following situation:


                 eth0    eth1.X(vlans)
internet----------[linux]-----------------[clients]


I *DO NOT* use private addresses so I don't use
NAT at all (just packet forwarding).

One of my clients tries to establish IPsec connection
to a host located somewhere outside of my network
and it doesn't work.

During the tests I removed all firewall rules.

tcpdump shows me:

[root@GW]# tcpdump -n -i eth1.9 -vv
tcpdump: listening on eth1.9, link-type EN10MB (Ethernet), capture size 96 bytes
12:09:59.200139 IP (tos 0x0, ttl 116, id 7059, offset 0, flags [none],
proto 50, length: 88) XX.XX.XX.XX > YY.YY.YY>YY: ESP(spi=0x139c2705,seq=0x35b)
12:10:01.767596 IP (tos 0x0, ttl 128, id 49969, offset 0, flags
[none], proto 50, length: 88) YY.YY.YY.YY > XX.XX.XX>XX: ESP(spi=0x43b9ff86,seq=0x3d3)

I tried to lower MTU on eth1.9 but it didn't help.
Any ideas ?


-- 
Best regards,
 Daniel                          mailto:daniel@rycaj.net



