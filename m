From: Sebastian Docktor <sebi@tux-labor.de>
Subject: Problem Matching Packets
Date: Wed, 6 Apr 2005 00:11:46 +0200
Message-ID: <20050405221146.GB31371@gw.home.tux-labor.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I've Problems to match a 255.255.255.255 Packet on the nat Chain.
If i use the mangle Chain I see the Packet but on the nat Chain
it look like the nat Chain does not receive the Packet.

gotia:~# tcpdump  -i eth0 udp and dst 255.255.255.255  and port 6111
tcpdump: verbose output suppressed, use -v or -vv for full protocol
decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
22:47:52.797757 IP 192.168.0.26.6111 > 255.255.255.255.6111: UDP,
length: 20
22:47:53.799741 IP 192.168.0.26.6111 > 255.255.255.255.6111: UDP,
length: 20
22:47:54.800352 IP 192.168.0.26.6111 > 255.255.255.255.6111: UDP,
length: 20

3 packets captured
3 packets received by filter
0 packets dropped by kernel
gotia:~# iptables -t nat -L -n -v
Chain PREROUTING (policy ACCEPT 281 packets, 13556 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DNAT       udp  --  eth0   *       0.0.0.0/0
255.255.255.255     udp spt:6111 dpt:6111 to:192.168.0.25:6111

Chain POSTROUTING (policy ACCEPT 1 packets, 90 bytes)
 pkts bytes target     prot opt in     out     source
destination
  284 13816 MASQUERADE  all  --  *      eth1    0.0.0.0/0
0.0.0.0/0

Chain OUTPUT (policy ACCEPT 8 packets, 616 bytes)
 pkts bytes target     prot opt in     out     source
destination
gotia:~#

I'm using iptables  1.2.11-10
and Kernel 2.6.10-1-k7

Is this a Bug or am I simply to stupid to create a Rule?


with regards

-- 
Sebastian Docktor <sebi@tux-labor.de>

