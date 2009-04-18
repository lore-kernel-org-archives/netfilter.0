From: Thomas Jacob <jacob@internet24.de>
Subject: Re: still can't route using fwmark
Date: Sat, 18 Apr 2009 22:58:02 +0200
Message-ID: <20090418205802.GA16790@internet24.de>
References: <op.uskfabufx1lyi3@localhost> <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost> <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <op.uslkl80px1lyi3@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lloyd Standish <lloyd@crnatural.net>
Cc: Thomas Jacob <jacob@internet24.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, Apr 18, 2009 at 01:34:42PM -0600, Lloyd Standish wrote:
> On Sat, 18 Apr 2009 12:48:09 -0600, Thomas Jacob <jacob@internet24.de> wrote:
> 
> >>How can I be sure fwmark is working?  Judging by my setup, which is very simple, packets and connections are being marked, but routing is not affected by fwmark.
> >
> > You can check the routing cache using "ip route show cache", and see what routing
> > decisions were taken.

<route cache output>

> Should there be signs here of fwmark-related decisions?

Don't think so, but you can see where packets are directed
for certain destinations

> > Maybe you could post your connmark related iptables rules as well.
> 
> I am logging the CONNMARK stuff now.  The logs show the connection marking taking place.  Here are the rules from my shell script, with a few comments I just now added.
> 
> # define CONNMARK1
> iptables -t mangle -N CONNMARK1
> iptables -t mangle -A CONNMARK1 -j MARK --set-mark 1
> iptables -t mangle -A CONNMARK1 -j CONNMARK --save-mark
> iptables -t mangle -A CONNMARK1 -j LOG --log-prefix 'iptables-mark1: ' --log-level info
> 
> # define CONNMARK1
> iptables -t mangle -N CONNMARK2
> iptables -t mangle -A CONNMARK2 -j MARK --set-mark 2
> iptables -t mangle -A CONNMARK2 -j CONNMARK --save-mark
> iptables -t mangle -A CONNMARK2 -j LOG --log-prefix 'iptables-mark2: ' --log-level info
> 
> # define RESTOREMARK
> iptables -t mangle -N RESTOREMARK
> iptables -t mangle -A RESTOREMARK -j CONNMARK --restore-mark
> iptables -t mangle -A RESTOREMARK -j LOG --log-prefix 'restore-mark: ' --log-level info
> 
> # define SNAT1
> iptables -t nat -N SNAT1
> iptables -t nat -A SNAT1 -j LOG --log-prefix "SNAT $src0: " --log-level info
> iptables -t nat -A SNAT1 -j SNAT --to-source $src0
> 
> # define SNAT2
> iptables -t nat -N SNAT2
> iptables -t nat -A SNAT2 -j LOG --log-prefix "SNAT $src1: " --log-level info
> iptables -t nat -A SNAT2 -j SNAT --to-source $src1
> 
> # restore the fwmark on packets that belong to an existing connection
> iptables -A PREROUTING -i eth0  -t mangle -m state --state ESTABLISHED,RELATED -j RESTOREMARK
> # if there is a mark, can quit
> iptables -A PREROUTING -t mangle -m mark ! --mark 0 -j RETURN
> 
> # mark all packets with fwmark 1 (A)
> iptables -A PREROUTING -t mangle -j CONNMARK1
> 
> # mark every other packet with fwmark 2 (B)
> iptables -A PREROUTING -t mangle -m statistic --mode nth --every 2 --packet 0 -j CONNMARK2
> 
> # fix source IPs to match interface IP
> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT1
> iptables -t nat -A POSTROUTING -o ppp1 -j SNAT2
> 
> # masquerade eth0
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Are you forwarding packets via this box, or do you want to loadbalance
packets from the local machine? In the latter case the PREROUTING
stuff needs to go into INPUT/OUTPUT.

Otherwise the rest looks fine to me, maybe making sure that you only
do the initial mark assignments for NEW packets might be a good
idea, but that most likely isn't a real problem.

> > Also you could try to remove those two routes in the default table, which I
> > gather from your description are routes for $gw0=$gw1=10.60.255.254 (btw, the
> > second will normally never be used anyway), I remember having problems before
> > when routes matched after the policy route tables in the main table.
> 
> Do you mean the routes in the rt_link1 and rt_link2 tables?  

no, the ones in the "main" routing table (that you displayed using "ip route show [table main]).


>I saw in a couple of articles on load balancing the suggestion that only the default route is necessary in each of the user-defined tables.  Of course, the only reason I use these tables is to be able to route through a different interface.

Yes, if you have a way to find your gateway (which is sort of implicit
when both gateway are on the same ethernet link with mask /24 for instance), but
in your case you seem to need host routes to designate where your default
gateways are (the first route in rt_link1/2), and the two routes in main
are the same as the first route in rt_link1 and 2 combined, right?

But maybe one does not need gateways for ppp since there should be no one else
on that link anyway (as you suggested with your "default dev pppX" routes).

Don't know sorry.

> > Why are you using the same IP (10.60.255.254) on different links? Possibly you could
> > try different IPs for that. I've haven't used PPP links for policy routing so far,
> > could be that they behave differently in some significant way wrt. to all this,
> > compared to broadcast networks.
> 
> 10.60.255.254 is the gateway for each of the links ppp0 and ppp1.  I cannot change that, and I don't see why the gateway should have to be different.

Well, if you have a route that says use gateway 10.60.255.254, then the kernel needs
to determine where that is by looking at the rest of the route tables, and if
you have several destinations, this could maybe be confusing...

> I ought to point out that I am connecting to my ISP using GPRS (ppp tunneled over GSM telephone connection).  The ISP assigns a private IP to me, and the gateway IP is also private.   The ISP is natting to a public IP, and that public IP changes constantly!  I assume this is part of some load-balancing that my ISP is doing!

There aren't enough IPv4 addresses around to give each mobile internet
device a real one, also changing IPs like that fcks with lot of
applications that mobile service providers really would not
like you to use (Skype, BT, etc ;)

I am running out of ideas, sorry, maybe someone else on the list
can chime in, I've only ever done policy routing with public IPs and
broadcast networks, and there it always worked without problems
on stock Debian Etch, CentOS 5.X or custom built kernels.
