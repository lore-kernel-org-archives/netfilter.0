From: Tore Anderson <tore@linpro.no>
Subject: Asymmetric routing and connection tracking
Date: Tue, 07 Aug 2007 09:06:53 +0200
Message-ID: <46B81A0D.6090900@linpro.no>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


  Hi.  I'm experiencing performance problems I think is related to
 netfilter (the prime suspect is connection tracking) when I have
 asymmetric routing.  My network looks something like this, if
 simplified enough:

    /------------------------+---(virutal router IP)--- servers
    |                        |
   eth2                     eth2
    |                        |
    R1 eth1------------eth1 R2
    |                        |
   eth0                     eth0
    |                        |
    \------------------------+--- transit provider

  R1 and R2 are a redundant router pair, which both get full BGP feeds
 from my transit providers on eth0.  On eth2 there's an access LAN
 (actually there's a lot of these) with servers and so on, and the
 default router address for those servers are present on either R1 and
 R2 (only one at a time).  On eth1 they speak OSPF so that the router
 that does not have the virtual address on eth2 still have a route to
 that subnet (because traffic bound to/from eth2 use connection
 tracking, only the active virtual router have a link-local route to the
 access LAN).

  My prefix is announced to my transit provider using a lower metric
 from R1, so normally inbound traffic is routed to it.  R1 is also the
 default virtual router, so normally R2 rarely see any traffic at all.
 However, if R2 reboots for some reason, R2 will take over the virtual
 router address on eth2, and my transit provider will reroute inbound
 traffic to it.  So far so good.  However, when R1 comes back online,
 I end up in a situation where inbound traffic is sent first to R1, then
 on to R2, out to the servers on the access LAN and then back to R2,
 which then routes the traffic directly out to the transit provider.
 Thus R1 only sees the inbound traffic.

  This worked fine...  until the inbound traffic level exceeds an
 insignificant amount (normally I have around 50-100Mbps, over 50% of
 which is HTTP GET requests, so mostly NEW connections).  I see severe
 packet loss when this happens, which doesn't stop until I either move
 the virtual address back to R1 (or simply shut it down completely).

  My conntrack table size is 0,5M (1 connection pr bucket) - normally
 the table has around 0,2M entries.  But for traffic that pass from
 eth0 to eth1 and vice verca there's no rules that match statefully
 (only simple filtering on src/dest net).

  Has anybody experienced similar problems, or can offer any insight as
 to how to solve it?

Kind regards
-- 
Tore Anderson

