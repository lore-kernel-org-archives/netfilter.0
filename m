From: Tom Fischer <tom.fischer@ebuz.de>
Subject: Re: DNAT-Problem
Date: Thu, 9 Sep 2004 16:13:07 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040909161307.022ec379@nixe>
References: <20040909041047.7f8457cf@nixe>
	<1094696804.1739.7.camel@wolfpack.ljm.dom>
	<20040909122931.3e8b4903@nixe>
	<1094729906.1897.2.camel@wolfpack.ljm.dom>
	<20040909135819.27094960@nixe>
	<1094736414.2044.22.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094736414.2044.22.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 09 Sep 2004 09:26:54 -0400
Jason Opperisano <opie@817west.com> wrote:

> On Thu, 2004-09-09 at 07:58, Tom Fischer wrote:
> > On Thu, 09 Sep 2004 07:38:26 -0400
> > Jason Opperisano <opie@817west.com> wrote:
> > 
> > > what are the IP addresses of $oldmachine and $newmachine
> > > (obfuscate the first two octets if you must)?
> > 
> > $oldmachine=81.16.97
> > $newmachine=80.190.140
> > 
> > There are a few IP-Adresse which i have to transfer to the
> > newmachine.
> > 
> > > are you trying to DNAT from one machine on the local network to
> > > another machine on the local network?  what network is the client
> > > traffic sourcing from?  is it the same network?
> > 
> > No, they are on different locations. The old one is in Innsbruck,
> > Austria and the new one in Munich, Germany.
> 
> for what it's worth--it sounds like your problem has much more to do
> with routing than with iptables firewalling.
> 
> i think i may have misunderstood your original post.  are you running
> iptables and the DNAT rule on $oldmachine?  if so, unless the reply
> packets from $newmachine are routed back through $oldmachine; this
> setup won't work (for what should be painfully obvious reasons).

Ok, i see the Problem. Is it possible to mark this packet and route it
based on the mark? I think i build a similar setup few weeks ago where i
have to route and nat packets which came in on eone vpn and should go
out on the other vpn.

> if your DNAT rule is on a gateway machine upstream from both
> $oldmachine and $newmachine--i'd say you have a routing failure
> somewhere in the chain.

No, unfortunately it is not. I will try to mark the packets.

Thx for help

Tom


