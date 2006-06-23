From: dog daemon <dog.daemon@gmail.com>
Subject: Could policy routing with fwmark be applied to locally generated
 packet ?
Date: Fri, 23 Jun 2006 17:46:42 +0800
Message-ID: <449BB882.8030706@gmail.com>
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

Hi all:

Below is the setting in my linux box :

          +--- eth0 10.5.30.17/24 ------------------- 10.5.30.254 gw
Linux Box |                             wired
          |
          +--- wlan 192.168.3.10/24 ----~~~~~------- 192.168.3.1 gw
                                       wireless

10.5.30.254 is the default gateway in my linux box, but it has multiple
gateways rather than single one. The difference between the two
gateways(10.5.30.254 and 192.168.3.10) is that the former is restricted
by MIS but rather fast, the later is free for any traffic but is very
slow and unstable.

The question is could we use netfilter fwmark to mark locally generated
port 80 packet (http) to certain fwmark(ex. 0x20), and route them to
wireless route, but keep the default gw being 10.5.30.254?

I have tested the following environment but it seemed that the packets
was be routed to the correct route, but had the incorrect source
address(the address of eth0).


mangle table and routing table, rules
================================================================================
SuperAMD linux # iptables -v -t mangle --list OUTPUT
Chain OUTPUT (policy ACCEPT 4549 packets, 551K bytes)
pkts bytes target     prot opt in     out     source
destination
   14   840 MARK       tcp  --  any    any     anywhere
anywhere            tcp dpt:http MARK set 0x20

SuperAMD linux # ip rule list
0:      from all lookup local
32765:  from all fwmark 0x20 lookup squid
32766:  from all lookup main
32767:  from all lookup default

SuperAMD linux # ip route ls
10.5.30.0/24 dev eth0  scope link
192.168.3.0/24 dev wlan0  scope link
127.0.0.0/8 dev lo  scope link
default via 10.5.30.254 dev eth0

SuperAMD linux # ip route ls table squid
192.168.3.0/24 dev wlan0  scope link  src 192.168.3.10
default via 192.168.3.1 dev wlan0
====================================================================================

tcpdump wlan0 when I invoked firefox

====================================================================================
SuperAMD ~ # tcpdump -i wlan0 -n tcp or icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on wlan0, link-type EN10MB (Ethernet), capture size 96 bytes
17:05:44.570096 IP 10.5.30.17.37418 > 64.233.189.104.80: S
2634301649:2634301649(0) win 5840 <mss 1460,sackOK,timestamp 13842 23
0,nop,wscale 2>
17:05:47.564537 IP 10.5.30.17.37418 > 64.233.189.104.80: S
2634301649:2634301649(0) win 5840 <mss 1460,sackOK,timestamp 13849 73
0,nop,wscale 2>
17:05:53.564917 IP 10.5.30.17.37418 > 64.233.189.104.80: S
2634301649:2634301649(0) win 5840 <mss 1460,sackOK,timestamp 13864 73
0,nop,wscale 2>

3 packets captured
6 packets received by filter
0 packets dropped by kernel
====================================================================================

I think that output routing decision was done before "OUTPUT" chain in
mangle table, and the outgoing address was already chosen(this is
different from building an router which redirect the incoming http
traffic to certain route).

Is there another way to fit this requirement or am i missing
something(documentation) ?
Thanks.


