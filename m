From: "Venkatesh. K" <venkatesh@cbayscribe.com>
Subject: Re: help required
Date: Mon, 10 Nov 2003 09:08:28 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <06f101c3a73c$1ae83dd0$2800a8c0@karu>
References: <20031109161122.8833.qmail@web10009.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Turning off connection tracking is not going to help you to conserve
CPU cycles. Savings in memory will be very less.

In fact, enabling the connection tracking helps you in cutting down
number of rules a packet has to traverse which in turn reduce the
number of CPU cycles.

Suppose you have 100 rules and a packet matching 100th rule has to
traverse 99 rules before there is a match. With connection tracking enabled
a packet belonging to an already established connection need to traverse
only one rule assuming the first rule in your chain allows all packets
belonging
to an established connection.

Each connection tracking requires only 292 bytes of memory. Considering
the cost of RAM today, it would be peanuts.

Thanks,

Venkatesh K
----- Original Message ----- 
From: "venky b" <bvr96@yahoo.com>
To: "SBlaze" <dagent.geo@yahoo.com>; <netfilter@lists.netfilter.org>
Sent: Sunday, November 09, 2003 9:41 PM
Subject: Re: help required


> Hi,
>
> Thanks for responding.
>
> My requirement is as follows
>
> I have a site with two IP subnets A and B.
>
> A is connected to eth0 of IPtables firewall and B is
> connected to eth1 interface.
>
> For accessing machines in other locations A must cross
> the firewall and go through the router in subnet B,
> i.e. WAN connectivity is through subnet B.
>
> I want to implement access control for traffic between
> A and B with stateful rules as B is not trusted by A.
>
> Rest of the traffic which is not from/to A
> specifically, i.e. coming from or going to other
> location should be allowed with ACCEPT target.
>
> There are so many application servers in other
> locations which will be accesed by subnet A users,
> around 400.
>
> So I do not want IPtables to keep connection tracking
> entries for this traffic as it hogs the memory and
> cpu.
>
> But at the same time it should keep track of
> communication betweeb A <-> B.
>
> Is there a way to turn off/on connection tracking for
> specific rules or chains ?
>
> Hope this make everybody clear.
>
> Thanks,
> Venkatesh
>
>
>
>
>
>
> --- SBlaze <dagent.geo@yahoo.com> wrote:
> > You need to be way more specific on what it is you
> > want to know. I don't think
> > anyone can really help you since your didn't provide
> > any information on what it
> > is you really want to provided stateful inspection
> > on.
> >
> > SBlaze
> >
> > --- venky b <bvr96@yahoo.com> wrote:
> > > Hi All,
> > >
> > > Need help on a specific requirement.
> > >
> > > I want to enable the stateful inspection only for
> > few
> > > chains.
> > >
> > > I do not want iptables to maintain state inof for
> > the
> > > rest of the chains as it is not needed.
> > >
> > > Any thoughts on this ?
> > >
> > > Cheers
> > > Venkatesh
> > >
> > >
> > > __________________________________
> > > Do you Yahoo!?
> > > Protect your identity with Yahoo! Mail
> > AddressGuard
> > > http://antispam.yahoo.com/whatsnewfree
> > >
> >
> >
> > =====
> > In the absence of order there will be chaos.
> >
> > __________________________________
> > Do you Yahoo!?
> > Protect your identity with Yahoo! Mail AddressGuard
> > http://antispam.yahoo.com/whatsnewfree
>
>
> __________________________________
> Do you Yahoo!?
> Protect your identity with Yahoo! Mail AddressGuard
> http://antispam.yahoo.com/whatsnewfree
>
>


