From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: qos tc mark bridge
Date: Wed, 25 Aug 2004 17:05:53 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <412CAAD1.1060800@uplink-verein.ch>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

already posted in comp.os.linux.security without much success.
hope i get a solution here.

moritz

rdgentry1@cablelynx.com (P Gentry) wrote in message 
news:<facb01db.0408200657.7327e777@posting.google.com>...
 > moritz@uplink-verein.ch (moritz gartenmeister) wrote in message 
news:<25d255b5.0408180653.63eb169f@posting.google.com>...
 > > hi all
 > >
 > > i really reach my limits with the following task:
 > > os: debian
 > > program: iptables + brigde
 > > goal: transparent bridge with traffic-shaping
 > >
 >
 > I'm hopelessly confused about your physical and logical setup -- ascii
 > art?

--[LAN1]---\                                            /--- Company
             [FireWallServer]--+--------+---[Gateway/NAT]
--[LAN2]---/        |         |        |                \--- WWW
                 AdminNIC    Sever1   LoggerServer

The FireWallServer has to be configured.
LoggerServer logs the internal traffic. We don't have access to the
NAT-table, so we have to log separtely (using Argus).
Server1 is web/mail-server and other stuff.
AdminNIC, Server1, LoggerServer all connected to a switch (also the
FireWallServer).

 > > 1. dst/src: there are severeal ip-ranges with no bandwithlimits, this
 > > means the traffic should be forwarded without further checking,
 > > including LAN and the two servers.
 > > 2. all other traffic should be shaped by application
 > > (layer7-extension).
 >
 > What app? Layer 7?  Kinda late to shape/police traffic there, don't
 > you think?  Doesn't make sense to me -- maybe I'm being obtuse.

Iptables with layer7-extension also the kernel is patched for this. I
think it is perfectly placed there. Maybe one remark: we have an
bandwithlimit on the gateway of 5mbit/s and no limit to the company
network.

 > > i tried to mark the packets in the mangle table (PREROUTING or
 > > filter). ...
 >
 > Incoming? Outgoing?  Both?

Incoming

 > > but i am really confused... marking the packets (e.g. HTTP)
 > > doesn't work, ...
 >
 > Marking how?  fwmark?  TOS?  Other?

fwmark (-j MARK --set-mark 1...5)

 > > because it will mark every packet without checking for
 > > dst/src. marking packets by dst/src will not work, because they are
 > > not correctly marked for the traffic-shaper.
 >
 > Which traffic-shaper are you referring to -- there are several?

INET_IF="eth0"
AC="tc class add dev "$INET_IF" parent"
AQ="tc qdisc add dev "$INET_IF
AF="tc filter add dev "$INET_IF" parent"

case "$1" in
   start)
  # clean existing uplink qdiscs, hide errors
  tc qdisc del dev $INET_IF root    2> /dev/null > /dev/null

  $AQ root handle 1: htb
  # for high and normal 4mbps mit max 5mbps
  $AC 1: classid 1:1 htb rate 4000kbps ceil 5000kbps
  # for p2p 1mbps strict
  $AC 1: classid 1:2 htb rate 1000kbps ceil 1000kbps prio 2
  # for high 0.5 mbps mit max 1mbps
  $AC 1:1 classid 1:10 htb rate 500kpbs ceil 1000kbps prio 0
  # for normal 3.5 mbps mit max 4.5mbps
  $AC 1:1 classid 1:11 htb rate 3500kbps ceil 4500kbps prio 1
  # change default qdisc for classes
  $AQ parent 1:10 handle 10: sfq perturb 10
  $AQ parent 1:11 handle 11: sfq perturb 10
  $AQ parent 1:2 handle 2: sfq perturb 10

  # filters
  $AF 1: protocol ip prio 1 handle 1 fw classid 1:10
  $AF 1: protocol ip prio 1 handle 2 fw classid 1:11
  $AF 1: protocol ip prio 2 handle 3 fw classid 1:2

 > > any ideas (in the case you understand my problem)? the problem (i
 > > assume) is, that i cannot use a userspecified target in the mangle
 > > table and i cannot use the mark target in filter table.
 >
 > You can do both if you know how -- but I've no idea what your setup
 > is, how you want traffic routed and shaped or why and absolutely no
 > hard data/output to see what's up?

I can do both, but not at the same time. My idea was:
1. Sort the traffic by (LAN, Company, WWW)
2. LAN, Company forward without shaping, put no mark on this packets.
3. Sort WWW-traffic by application into three buckets (chains...)
3.1 SSH, SSL connections to bucket 1, mark this packets with 1.
3.2 HTTP, SMTP, FTP connections to bucket 2, mark this packets with 2
3.3 the rest to bucket 3, mark this packtets with 3.
this is done by:
$IPTABLES -A extern -m layer7 --l7proto ssh -j high
$IPTABLES -A extern -m layer7 --l7proto http -j normal
$IPTABLES -A extern -m layer7 --l7proto ftp -j normal
$IPTABLES -A extern -m layer7 --l7proto gnutella -j p2p

extern is a userspecified chain, which contains the traffic to and
from WWW.

high, mormal, p2p are user-specified chains.
now the marking.

## rules for high
     $IPTABLES -A high -j MARK --set-mark 1
     $IPTABLES -A high -j ACCEPT

## rules for normal
     $IPTABLES -A normal -j MARK --set-mark 2
     $IPTABLES -A normal -j ACCEPT

## rules for p2p
     $IPTABLES -A p2p -j MARK --set-mark 3
     $ITPABLES -A p2p -j ACCEPT

and then the tc-rules will apply.
this was my idea.
the problem is, that i cannot use -j MARK in a mangle table/chain (i
am a little confused about this notions...)
and i cannot use user-specified chains in a mangle table/chain.

 > You'll need to be quite specific about your hardware and network setup
 > -- it's still very unclear to me.  Bridge?  Router?  What's what and
 > where is it?  How _do_ you connect to internet/ISP?  Single
 > connection?  Leased router?  Why a bridge/firewall?  This one:

it is a dell-server (poweredge) with 4 nics.
three of them (LAN1, LAN2 and the connection to the gateway will be a
bridge:
brctl addbr br0
brctl addif br0 eth1 and so on.
the bridge has no IP. only eth0 has an IP (the adminNic). I don't want
to do routing because the MAC-Sourceadress will change and so I can no
longer track a specific connection to a specific switchport (we are
using 3comSwitches 3300...). btw: the brigde works properly and i can
also stop traffic and mark traffic (but not in the same table).

 > http://ebtables.sourceforge.net ?

later i will use them to close a connection from a specific client.

 > or this:
 > http://www.tldp.org/HOWTO/Ethernet-Bridge-netfilter-HOWTO-1.html
 > or something else?

almost exactly this. but see above (mark and userspecified chain
problem).
private IP space.

 > I'm in the dark and can't help without some light -- lots of it ;-)
 >
 > Also your _reason_ for a Linux bridge rather than a router might shed
 > some light also.  Be warned:  I've never seen the purpose of using
 > Linux as a bridge -- what do you hope to gain?

routing will change the mac-adresses, this will disallow me to log the
traffic properly. the clients are using DHCP, so it is not enough to
keep the ip-adresses. i store regulary the databases of the switches
(mac-adresses <-> port). i will gain a transparent traffic-shaper and
i will not loose the logging.

hope this gives some light.
moritz

