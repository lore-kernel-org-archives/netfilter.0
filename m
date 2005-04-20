From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: NAT stops working
Date: Wed, 20 Apr 2005 17:05:13 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF869A6A@p001ex03.porta.local>
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
To: Daniel Wittenberg <daniel-wittenberg@starken.com>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

mh could it be that your conntrack table is full (if you use it of =
course)?
check your syslog for conntrack messages maybe that could be a reason.

greetings=20

Matthias Baake

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Daniel
Wittenberg
Sent: Wednesday, April 20, 2005 4:50 PM
To: netfilter@lists.netfilter.org
Subject: NAT stops working


We've got a high-speed wireless and DSL connection so I decided to try
and load-balance the out-going connections.  I run a little script that
does:

route flush scope global
route flush cache
route add default scope global equalize nexthop via <external gw 1> dev
eth0 weight 1 nexthop via <external gw 2> dev eth1

This appears to work for awhile, then incoming connections stop getting
nat'd to their internal addresses.  I reboot or reset the firewall
(flush all the tables and re-run this script) and things are good again
for awhile.  I tried flooding some of the external IP's that are nat'd
and it seems like after a certain amount of traffic the nat just stops
working.  tcpdump shows traffic on the external interface coming in, but
not going out anywhere.

Anyone have ideas on how to debug this further or things to check?

Thanks,
Dan



