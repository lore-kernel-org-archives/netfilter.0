From: =?ISO-8859-1?Q?M=E5rten_Segerkvist?= <volodja@acc.umu.se>
Subject: NAT doesn't work (only a fraction of the forwarded packets reach
 the postrouting chain)
Date: Sun, 13 Mar 2005 11:11:22 +0100 (MET)
Message-ID: <Pine.GSO.4.62.0503131105020.8331@shaka.acc.umu.se>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello!

I'm setting up a simple linux router to forward packets between my local wlan 
and internet; while doing so, I'm using the _same rules_ as on another machine 
doing the same thing at another location, that is:

echo 1 > /proc/sys/net/ipv4/ip_forward
modprobe ipt_MASQUERADE
modprobe iptable_filter
iptables --table nat --append POSTROUTING --out-interface eth0 -j MASQUERADE
iptables --append FORWARD --in-interface wlan0 -j ACCEPT

The packages from wlan never get through, though. A verbose listing of the 
different chains after a few minutes of pinging varios location gives me:

> iptables -L -v

Chain INPUT (policy ACCEPT 6316 packets, 727K bytes)
  pkts bytes target     prot opt in     out     source destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source destination
   314 12560 ACCEPT     all  --  wlan0  any     anywhere anywhere

Chain OUTPUT (policy ACCEPT 4976 packets, 762K bytes)
  pkts bytes target     prot opt in     out     source destination

> iptables -t nat -L -v

Chain PREROUTING (policy ACCEPT 14 packets, 668 bytes)
  pkts bytes target     prot opt in     out     source destination

Chain POSTROUTING (policy ACCEPT 1 packets, 228 bytes)
  pkts bytes target     prot opt in     out     source destination
    18  1080 MASQUERADE  all  --  any    eth0    anywhere anywhere
     0     0 LOG        all  --  any    any     anywhere anywhere            LOG 
level warning

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source destination

As only 18 out of 314 (compared with 37959 out of 3836K packets on the working 
router with the same rules) packets reaches the POSTROUTING chain (out of which 
none results in a pong), i figured this might have something to do with the 
problem?

I tried to log the packets reaching POSTROUTING with

> iptables -t nat -A POSTROUTING -j log

but none of them showed up in the syslog; that's a minor? problem though.

I'd be most grateful for any suggestions!

(iptables is compiled with the 2004.3 gentoo-ppc-livecd toolset against 
2.6.8.1, running on a mac mini with a d-link dwl-122 802.11b dongle 
using linux-wlan-ng).

/M. Segerkvist

