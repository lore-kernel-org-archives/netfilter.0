From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: bridging with iptables (was no subject)
Date: Sun, 30 Jun 2002 00:01:34 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJGEJGDOAA.jpatterson@asgardgroup.com>
References: <1025308208.860.9.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1025308208.860.9.camel@tux>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Martin Josefsson <gandalf@wlug.westbo.se>, Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: Netfilter <netfilter@lists.samba.org>

or, (note that I have not actually tried this, but I think that it would
*probably* work) use a gre tunnel over ipsec, and then add the gre tunnel to
the bridge group.  Actually, I have done this, but on cisco's instead of on
linux boxes (and when you put the commands into the cisco, it lets you know
in no uncertain terms that you are entering into unsupported territory)

and the really cool thing about this is, not only can you do wierd routing
and filtering, but you can get the advantages of ipsec encryption and
authentication for unroutable non-ip protocols.

but you're right, this is getting really off-topic now....  But, to bring it
somewhat back onto topic...

Does anyone know how netfilter deals with non-ip protocols?  If you've got
your linux box set up as, for example, an ipx router, and you've got
iptables loaded with default drop rules in your forward chain, do the ipx
packets get through?  My suspicion is that they do, but I'm not sure.  My
suspicion is that netfilter only gets involved when a packet is of type
IP...  But the fact that netfilter can be hooked into a bridging stack makes
me wonder...

-Joe

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Martin Josefsson
> Sent: Friday, June 28, 2002 7:50 PM
> To: Antony Stone
> Cc: Netfilter
> Subject: Re: bridging with iptables (was no subject)
>
>
> On Sat, 2002-06-29 at 00:53, Antony Stone wrote:
>
> > > Yes, look at the bridge-netfilter project:
> > > http://bridge.sourceforge.net/
> >
> > Hmmm.   Good.
> >
> > I know this is getting a bit off-topic now, but does anyone
> know if you can
> > combine bridging with IPsec ?   ie have two bits of the same
> network address
> > range bridged across a VPN link ?
> >
> > I've only ever set up IPsec links with a routing table pointing to the
> > 'other' network across the VPN link...
>
> Use bridge + CIPE for that.
>
> I've never used it but I've heard that it works fine, it's not IPsec but
> another encrypted VPN.
>
> --
> /Martin
>
> Never argue with an idiot. They drag you down to their level, then beat
> you with experience.
>
>
>


