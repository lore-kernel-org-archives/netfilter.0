From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Asymmetric routing and connection tracking
Date: Tue, 07 Aug 2007 15:47:26 +0200
Message-ID: <1186494447.28140.57.camel@localhost>
References: <46B81A0D.6090900@linpro.no>
	<1186487970.28140.20.camel@localhost>  <46B87149.20505@linpro.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B87149.20505@linpro.no>
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

>   There are no rules that does stateful matching for traffic that is
>  forwarded between two routers.  Such rules are only applied for traffic
>  that is forwarded to an access LAN (like eth2).  Traffic that comes in
>  from a transit provider and are forwarded directly to another router is
>  only filtered based on simple source/destination matches in the IP.
> 
>   If such rules do not match, and the router is the last hop before a
>  packet reaches its destination, it will apply stateful matching.  But
>  this happens only for packets to/from access VLANs like eth2 in my
>  drawing.

So in the scenario described, R1 wouldn't do any stateful packet
filtering for packets to and from the internal server network? But
the connections will be added to the connection tracking table of
R1 nonetheless (unless you use the NOTRACK target
in raw), only not with an ESTABLISHED state which probably
means they timeout more often than needed and you have
more insert/remove actions over the connection tracking hash
table, maybe that's the source of your problem.

You could try the NOTRACK/raw thing on the (internal-)standby-router,
or you could route the packets of connections that have incoming data
from
R1 back out over R1 with a policy routing setup (+connmark) on R2.

>   I have several transit providers, but since it's not really relevant
>  for the problem (at least I don't think so) I didn't bother to draw
>  them.  You're right that using some form of VRRP could have been a
>  possible solution though if I had only one, so I should have mentioned
>  it.  Apologies.

OK that makes sense, otherwise this would be high
up on my list for "most complicated solution for a simple problem" :-)

  Thomas


