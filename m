From: "Ian Hunter" <ihunter@hunterweb.net>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 11:37:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <011001c3c0ce$2d96a830$b2c2a70a@melita.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <003c01c3c0b1$dd2b6960$b2c2a70a@melita.com> <1071235889.1890.47.camel@jasiiitosh.nexusmgmt.com> <200312121359.27728.Antony@Soft-Solutions.co.uk>
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

That's in line with what I thought.  So I'm back to not having an
explanation for why some packets would get rejected as not part of an
existing connection.

So at this point best bet is >60 second delay somewhere?  That doesn't seem
likely... if I log all port 80 traffic, and wait until I see another drop, I
should be able to correlate the two and verify that.  Is that my best
option?

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Friday, December 12, 2003 8:59 AM
Subject: Re: Weird TCP flags?


> > > iptables -A FORWARD -i ppp0 -o eth1 -p tcp --dport 80 -d
192.168.254.242
> > > -j ACCEPT
> > > iptables -t nat -A PREROUTING -i ppp0 -d <my.public.ip.here> -p tcp
> > > --dport 80 -j DNAT --to-destination 192.168.254.242
> > >
> > > If I want to forward port 80 to that box, isn't that the way to do it?
> > > How would a connection escape conntrack?
>
> > You never told it to make an entry in conntrack.  Try this:
> > iptables -A FORWARD -i ppp0 -o eth1 -p tcp --dport 80 -d 192.168.254.242
> > -m state --state NEW -j ACCEPT
>
> I disagree with this.
>
> Making the rule more explicit by matching state NEW is not a bad idea, but
it
> has nothing to do with whether a conntrack table entry gets created or
not.
> If you have compiled in connection tracking, or loaded the module, then
all
> connections which are ACCEPTed will result in a conntrack table entry.
> There's no way to stop that happening on a connection-by-connection basis.


