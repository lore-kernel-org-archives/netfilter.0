From: Tore Anderson <tore@linpro.no>
Subject: Re: Asymmetric routing and connection tracking
Date: Tue, 07 Aug 2007 15:19:05 +0200
Message-ID: <46B87149.20505@linpro.no>
References: <46B81A0D.6090900@linpro.no> <1186487970.28140.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1186487970.28140.20.camel@localhost>
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
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@lists.netfilter.org

* Thomas Jacob

> Assuming that you do some sort of stateful firewalling on both R1 and
> R2, I wonder why this works at all, as at least netfilter in kernel
> 2.6 isn't too happy about only seeing one direction of a particular
> connection's traffic, (this used to work in 2.4 stock kernels).

  There are no rules that does stateful matching for traffic that is
 forwarded between two routers.  Such rules are only applied for traffic
 that is forwarded to an access LAN (like eth2).  Traffic that comes in
 from a transit provider and are forwarded directly to another router is
 only filtered based on simple source/destination matches in the IP.

  If such rules do not match, and the router is the last hop before a
 packet reaches its destination, it will apply stateful matching.  But
 this happens only for packets to/from access VLANs like eth2 in my
 drawing.

> Apart from that, I'd be interested to know why you set up this system
> with BGP and OSPF? If you have just on upstream transit provider?

  I have several transit providers, but since it's not really relevant
 for the problem (at least I don't think so) I didn't bother to draw
 them.  You're right that using some form of VRRP could have been a
 possible solution though if I had only one, so I should have mentioned
 it.  Apologies.

  My network is a bit larger than my drawing anyway, and it's not that
 easy (or desireable, for that matter) to make sure packets between two
 hosts take the same route in both directions.  But I would like to be
 able to use stateful firewalling on the routers that have the role as
 access routers too.

Regards
-- 
Tore Anderson

