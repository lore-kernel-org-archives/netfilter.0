From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: Destination NAT Onto the Same Network Problem
Date: Wed, 10 Jul 2002 11:10:21 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJKEKGDOAA.jpatterson@asgardgroup.com>
References: <200207101457.g6AEvw812845@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207101457.g6AEvw812845@vulcan.rissington.net>
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
To: netfilter@lists.samba.org


>
> > <Antony@Soft-Solutions.co.uk> wrote:
> > > This one looks a bit odd to me, even though I've written it
> myself, but I
> > > think it should do the trick:
> > >
> > > $IPTABLES -t nat -A POSTROUTING -o $INTIF -i $INTIF -j MASQUERADE
> >
> > "-i" can't be used in the POSTROUTING hook.
>
> Oh.   I knew you couldn't use -o in PREROUTING, because the
> routing hasn't
> been done yet, but I would have thought that POSTROUTING would
> remember where
> the packet came in from ?

Yeah, that's always bothered me too.  I'm sure there's a good reason, but it
doesn't make sense to me.

The way around it, of course, is to set a mark in mangle/PREROUTING on
the -i interface, then check the mark in nat/POSTROUTING.  Alternatively,
you can of course use -s $INTERNAL_NET

-Joe


