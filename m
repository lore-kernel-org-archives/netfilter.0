From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: NAT doesn't work (only a fraction of the forwarded packets
	reach the postrouting chain)
Date: Sun, 13 Mar 2005 11:41:55 +0100
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49B72@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

From man iptables:
MASQUERADE
       This target is only valid in the nat table, in the POSTROUTING =
chain.  It should only
       be used with dynamically assigned IP (dialup) connections: if you =
have  a  static  IP
       address,  you should use the SNAT target. =20

Try using regular SNAT rule:

Iptables --table nat --append POSTROUTING --out-interface eth0 -j SNAT =
--to-source:your.pub.ip.addr

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of M=E5rten =
Segerkvist
Sent: Sunday, March 13, 2005 11:11 AM
To: netfilter@lists.netfilter.org
Subject: NAT doesn't work (only a fraction of the forwarded packets =
reach the postrouting chain)

Hello!

I'm setting up a simple linux router to forward packets between my local =
wlan=20
and internet; while doing so, I'm using the _same rules_ as on another =
machine=20
doing the same thing at another location, that is:

echo 1 > /proc/sys/net/ipv4/ip_forward
modprobe ipt_MASQUERADE
modprobe iptable_filter
iptables --table nat --append POSTROUTING --out-interface eth0 -j =
MASQUERADE
iptables --append FORWARD --in-interface wlan0 -j ACCEPT

The packages from wlan never get through, though. A verbose listing of =
the=20
different chains after a few minutes of pinging varios location gives =
me:

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
     0     0 LOG        all  --  any    any     anywhere anywhere        =
    LOG=20
level warning

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source destination

As only 18 out of 314 (compared with 37959 out of 3836K packets on the =
working=20
router with the same rules) packets reaches the POSTROUTING chain (out =
of which=20
none results in a pong), i figured this might have something to do with =
the=20
problem?

I tried to log the packets reaching POSTROUTING with

> iptables -t nat -A POSTROUTING -j log

but none of them showed up in the syslog; that's a minor? problem =
though.

I'd be most grateful for any suggestions!

(iptables is compiled with the 2004.3 gentoo-ppc-livecd toolset against=20
2.6.8.1, running on a mac mini with a d-link dwl-122 802.11b dongle=20
using linux-wlan-ng).

/M. Segerkvist


