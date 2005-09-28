From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Loadbalancing question
Date: Wed, 28 Sep 2005 00:43:50 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B5804@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,=20

I know we've been through this question several times but I still have a
question on this topic.  At the remote location we have two 256kbit
lines (best we can get right now).  Generally, we would want to use one
for the internet and one for the VPN (IPSEC) connection to the CO.=20

I think I have successfully configured the balancing (it's included at
the bottom - If you could eyeball that as well I'd appreciate any
comments).  Some people at the remote office need to connect to their
office directly.  This means that when they connect we need to SNAT/DNAT
their request to an internal server using one of their public IP's.
That's easy as well.  But we need to ensure that traffic coming from the
servers to the internet goes through the first connection and traffic
bound for the remote office (specifically IP 20.30.40.50) only goes
through the second connection.  We aren't really looking for fail over
per say but rather split usage.

What I have done in the past is to specify the primary gateway as the
first line and setup a route via the second network range to the remote
office.  This works as traffic seems to go out the second line to the
office.  But the problem is if the first line drops then the second
fails to work.  These lines are through two different ISP's and both
have different reliability problems.

So the script I have below should balance the line, but I'd rather split
the traffic accordingly.  I though about forcing the traffic from server
10.94.17.10 to use just the second line but the problem is it sends
email and does other stuff thus clogging the VPN line.

Also, to make things a little more interesting, the server 10.97.17.10
is SNAT/DNAT'd to one external IP on each interface but I can only get
it to answer on one of the calling lines (the first one).

Is there a better way to do this? =20

So, to recap, I want traffic from 10.94.17.x to go out the first line
unless it is destined for 20.30.40.50/29 in which case I want it to go
out the second line.  Also, I want return traffic to return through the
same path it came in through.  So, if a user comes through the first
line it will return on the first line, etc.  So this basically provides
a redundancy for the internal server as well.

With that said, what would the iptables mapping be to do the return
traffic?


Script for balancing the line (I know this script doesn't match the
scenario but it's a start).

#!/bin/sh

# LAN
LAN_IF=3Deth1
LAN_IP=3D10.94.17.254
LAN_NET=3D10.94.17.0/24

# NET 1
INET1_IF=3Deth0
INET1_IP=3D88.55.66.249
INET1_NET=3D88.55.66.248/29
INET1_GW=3D88.55.66.254

# NET 2
INET2_IF=3Deth2
INET2_IP=3D99.44.55.1
INET2_NET=3D99.44.55.0/29
INET2_GW=3D99.44.55.6

/sbin/ip rule del prio 50 table main
/sbin/ip rule add prio 50 table main
/sbin/ip route del default table main=20

/sbin/ip rule del prio 201 from $INET1_NET table 201
/sbin/ip rule add prio 201 from $INET1_NET table 201
/sbin/ip route add default via $INET1_GW dev $INET1_IF \
            src $INET1_IP proto static table 201
/sbin/ip route append prohibit default table 201 metric 1 proto static
           =20
/sbin/ip rule del prio 202 from $INET2_NET table 202
/sbin/ip rule add prio 202 from $INET2_NET table 202
/sbin/ip route add default via $INET2_GW dev $INET2_IF \
            src $INET2_IP proto static table 202
/sbin/ip route append prohibit default table 202 metric 1 proto static
   =20
/sbin/ip rule del prio 222 table 222
/sbin/ip rule add prio 222 table 222
/sbin/ip route add default table 222 proto static \
            nexthop via $INET1_GW dev $INET1_IF \
            nexthop via $INET2_GW dev $INET2_IF
