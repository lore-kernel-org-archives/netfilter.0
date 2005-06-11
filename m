From: Tib <tib@tigerknight.org>
Subject: Re: Hi!
Date: Sat, 11 Jun 2005 13:22:52 -0500 (CDT)
Message-ID: <Pine.LNX.4.53.0506111321350.9775@altaica>
References: <2e51be410506111000557ddca1@mail.gmail.com> 
	<Pine.LNX.4.53.0506111202260.9775@altaica>
	<1118512593.18567.6.camel@debianbox>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1118512593.18567.6.camel@debianbox>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Sadus ." <sadus@swiftbin.net>
Cc: netfilter@lists.netfilter.org


Caveat to what I just said - if you are doing masquerading behind a single
IP, then you don't need to worry about the FORWARD ruleset. Only packets
associated with connections  that are being masqueraded will get sent on
to internal networks - unless you have specific ports that are translated
to internal services.

<EOL>
Tib

On Sat, 11 Jun 2005, Sadus . wrote:

> I usually block only in the INPUT chain, doesn't it protect my internal
> network?
> I only have SNATed the internal network to the external IP/
>
> On Sat, 2005-06-11 at 12:16 -0500, Tib wrote:
> > Hi there,
> >
> > Thought I'd chip in since this used to be identical to how I had my system
> > setup. I had a block of 5 useable from my isp.
> >
> > Whichever you are going to use as your actual firewall box IP (as opposed
> > to the machines you want to run behind it), you set as eth0 ip config.
> >
> > After that you setup the other ip's as virtual interfaces on the same card
> > (eth0:1, eth0:2, etc). Set your internal IP nic to be eth1 and make sure
> > the routing table is set to go through it out to eth0 and the world. Have
> > your other internal IP boxes use eth1 as their gateway.
> >
> > After that, you setup destniation nat'ing using something like this:
> >
> > iptables -t nat -A PREROUTING -d $REAL-IP$ \
> >                 -j DNAT --to-destination $INTERNAL-IP$
> >
> > and
> >
> > iptables -t nat -A POSTROUTING -s $INTERNAL-IP$ \
> >                 -j SNAT --to-source $REAL-IP$
> >
> > for each internal/ip pair you want to have mapped.
> >
> > After you've done this - you're likely going to want to protect them from
> > certain types of traffic, since the basic INPUT rules won't cover it - put
> > anything you DON'T want to reach those hosts under the FORWARD ruleset as
> > drops.
> >
> > That's it - you're set.
> >
> > One item of note - be sure to put those snat/dnat rules into the table
> > BEFORE the catchall masquerading rule (if you use one) otherwise they will
> > hit the masquerade rule first and your traffic will not match in/out ip's
> > and things will bork up.
> >
> > This is a setup I've used for a number of years, it's nice and clean and
> > gives good protection through the forward ruleset. If you cover your bases
> > right and practice safe net, things like zone alarm become unnecessary.
> >
> > I blocked the following on forward and have done very well by it:
> >
> > udp:
> > 111
> > 135
> > 137
> > 138
> > 139
> > 445
> > 1026
> > 1433
> >
> > tcp:
> > 21
> > 57
> > 79
> > 80
> > 111
> > 135
> > 137
> > 138
> > 139
> > 443
> > 445
> > 1025
> > 1026
> > 1433
> > 5000
> > 31337
> >
> > These will vary depending on your particular software usage and such - but
> > are a good start.
> >
> > <EOL>
> > Tib
> >
> > On Sat, 11 Jun 2005, Billie Joe wrote:
> >
> > > Hi!
> > >
> > >
> > > I have 3 IPs on Internet, and I want to put them behind my firewall
> > > machine. So I have the question: Put all 3 IPs in the same network
> > > card (with alias) or a card for each IP ?? What you suggest and why ??
> > > Thanks
> > >
> > >
> > > pS.: Consider that I have another NIC for my LAN.
> > >
> > >
> > > BillieGDJoe
> > >
> >
>

