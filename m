From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: more questions about kernel config options for iptables
Date: Tue, 8 Apr 2003 08:23:58 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304080806380.10072-100000@dell>
References: <1049802905.11714.95.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1049802905.11714.95.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Joel Newkirk <netfilter@newkirk.us>, iptables mailing list <netfilter@lists.netfilter.org>

On 8 Apr 2003, Cedric Blancher wrote:

> Le mar 08/04/2003 =E0 13:01, Robert P. J. Day a =E9crit :
> > > >   first, the basic Connection tracking option claims to be
> > > > necessary for masq/NAT.  what value is that option if it is
> > > > the only one selected?  it may be *necesasry* for masq/NAT,
> > > > but it certainly doesn't seem to be *sufficient*.  what is
> > > > the value of selecting that single option to the exclusion
> > > > of all others.  what does it allow you to do?
> =

> It allows kernel to assemble packets into sessions, which is called
> connection tracking, with optional module support for "strange"
> protocoles such as FTP or H323, which provides what can be called "leve=
l
> 5" filtering.
> =

> With this option only, your kernel will only follow sessions. But as it=

> does not make decisions wether to accept, refuse or anything else for a=

> packet based on this, you won't see any visible effect of this.

that makes sense.  so selecting "Connection tracking" simply
builds in the *capability* to do connection tracking (implemented,
IIRC, by /proc/net/ip_conntrack), which *can* be used by adding
other options.  by itself, it doesn't seem to support any
user-available "iptables" features, but just having it running
may enable someone to at least view the current connection
tracking status, while not really being able to do anything about
it.
 =

> If you don't select IP tables support, then you won't have nat table,
> and so won't be able to configure nat stuff. It's the same for mangle
> and filter.

that's what i thought.  without "IP tables support", there's really
nothing you can do in the way of either filtering or NATting.
although you can still do connection tracking, for all the good
that does you.
 =

> > 1) you can select "IP tables support" without selecting one
> >    of its submenu options, "Packet filtering".  what is the
> >    possible value of this?  what can you do?  as i read it,
> >    perhaps it means that you can still do filter-less
> >    NAT and masquerading.  if that's the case, i can accept
> >    that.
> =

> You can select this, and nothing else. This means your kernel is readin=
g
> to have tables for IPv4. But he won't have any. It is about the same
> than saygin "I want my kernel to support modules", but having no module=

> at all. You can support them, but you don't use them. You can also
> select matches, but not "Packet filtering", "Full NAT" or "Packet
> mangling". This will means that you'll have material to create rules
> (matches and targets), but no table to place them in (except if you hav=
e
> your own table).

in other words, you're building in a *support system* for unselected
features, but without actually picking these features, it's not
doing you much good.  that's why i was thinking that a reworking
of that entire config menu might be in order -- why let users
pick what turns out to be a non-functional set of options?
it would make far more sense to have a list of menu options
that reflects what a user would want to *do*, and have the
underlying dependencies kept invisible.  a more readable menu
like:

   Basic filtering
     Connection tracking
   NAT
   Packet mangling

and so on.  stuff that reflects how someone would *use* iptables,
and now the way it's structured inside the kernel, which most
people don't care about.
 =

> You have tables support for IPv6 and ARP as well, because you can have =
a
> set of tables for each layer 3 protocol Netfilter handles.
> =

> > 2) you can select "Connection tracking" (which is allegedly
> >    required for NAT/masq), without selecting "IP tables support",
> >    which also claims to be necessary for NAT/masq.  this
> >    suggests that "Connection tracking" should have a dependency
> >    of "IP tables support", no?
> =

> Nope.
> Connection tracking does not depend on IP tables, neither IP tables
> depends on connection tracking. But, some feature of IP tables depends
> on connection tracking, such as state matching and NAT stuff. As you ca=
n
> see in kernel configuration, if you don't select connection tracking,
> you can't select NAT or state matching anymore.

gotcha.  if you want masq/NAT, you would have to select
not only Connection tracking, but IPtables support and,
within that, "Full NAT".  and that's why i dislike the current
menu layout.  it would be more reasonable for someone to say,
"i want NAT", and have the underlying dependencies automatically
satisfied.

i'll give this some thought, and perhaps move this to =

netfilter-devel, as i was unaware that there was such a
list.

thanks.

rday


