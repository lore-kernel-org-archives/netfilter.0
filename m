From: Nick Taylor <nickt@lightlink.com>
Subject: Re: nat problem
Date: Tue, 13 Jul 2004 19:11:13 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0407131904390.14186@adore.lightlink.com>
References: <40F448B2.AF1E21@knoware.nl> <200407132206.08404.Antony@Soft-Solutions.co.uk>
 <40F4607B.60B1E512@knoware.nl> <200407132353.57143.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407132353.57143.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> > > > I have a little problem, which might be a bug. I have an 3COM
> > > > ISDN-router. It broadcasts every 10 seconds its connectionstatus to the
> > > > internal net. Now I want to forward those broadcasts to another
> > > > network.
> > >
> > > > What do you mean by "broadcasts"?   What protocol is being used?   What
> > > > address are the packets sent to?
> >
> > These are real broadcasts to 192.168.1.255. The protocol is UDP, the source
> > port is 1025 and the destination port is 2071.Isn't it weird, that at the
> > nat-table, when I add a rule for logging, I can't see the above meant
> > packets, but at the filter- and the mangle-table those packets are logged?
>
> No, I don't think so.   Broadcast packets are not supposed to cross routers
> (they will enter the router as a machine on the local subnet, but they will
> not be routed anywhere else, because they already come from the subnet they
> are addressed to)
>
Not to be contrary, and *NOT* to suggest that this is correct behaviour,
but...  The company I used to work for uses a lot of LinkSys gear for CPE,
including their NAT routers and their VPN routers, and we've had bizarre
problems with these products.  The VPN router, in particular *will*
forward a packet with the destination address set to the IP broadcast
address!  Then, they run NAT rules beyond the VPN server at the other
side, so you get:
192.168.1.43 -> 192.168.1.255, which getts natted to:
real_ip -> 192.168.1.255, but of course, that's behind the VPN tunnel, so,
the box routes it back through the VPN, where it gets spit out on the
customer's lan, (thankfully NOT forwarded back again) but this confuses
Windoze something aweful, and causes it to refuse to use windows
networking, because it thinks there's another machine on the network with
it's name registered. DOH!  Anyway, the point is that while it may or may
not be correct, many products do it, and there must be some (twisted)
reason that the hardware vendors chose to enhance (read break) their
products in this way, ie, some application may depend on this (braindead)
behaviour.

