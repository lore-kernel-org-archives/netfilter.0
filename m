From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: more questions about kernel config options for iptables
Date: 08 Apr 2003 13:55:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049802905.11714.95.camel@elendil.intranet.cartel-securite.net>
References: <Pine.LNX.4.44.0304080644440.25860-100000@dell>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304080644440.25860-100000@dell>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Joel Newkirk <netfilter@newkirk.us>, iptables mailing list <netfilter@lists.netfilter.org>

Le mar 08/04/2003 =E0 13:01, Robert P. J. Day a =E9crit :
> > >   first, the basic Connection tracking option claims to be
> > > necessary for masq/NAT.  what value is that option if it is
> > > the only one selected?  it may be *necesasry* for masq/NAT,
> > > but it certainly doesn't seem to be *sufficient*.  what is
> > > the value of selecting that single option to the exclusion
> > > of all others.  what does it allow you to do?

It allows kernel to assemble packets into sessions, which is called
connection tracking, with optional module support for "strange"
protocoles such as FTP or H323, which provides what can be called "level
5" filtering.

With this option only, your kernel will only follow sessions. But as it
does not make decisions wether to accept, refuse or anything else for a
packet based on this, you won't see any visible effect of this.

> right, that's what the kernel config options seem to suggest.
> so what is the value of selecting *only* "Connection tracking"
> if you don't select "IP tables support" as well?  note that,
> based on the dependencies in the kernel config process, this is
> certainly allowable, but it's not clear to me what this would
> represent.

If you don't select IP tables support, then you won't have nat table,
and so won't be able to configure nat stuff. It's the same for mangle
and filter.

> 1) you can select "IP tables support" without selecting one
>    of its submenu options, "Packet filtering".  what is the
>    possible value of this?  what can you do?  as i read it,
>    perhaps it means that you can still do filter-less
>    NAT and masquerading.  if that's the case, i can accept
>    that.

You can select this, and nothing else. This means your kernel is reading
to have tables for IPv4. But he won't have any. It is about the same
than saygin "I want my kernel to support modules", but having no module
at all. You can support them, but you don't use them. You can also
select matches, but not "Packet filtering", "Full NAT" or "Packet
mangling". This will means that you'll have material to create rules
(matches and targets), but no table to place them in (except if you have
your own table).

You have tables support for IPv6 and ARP as well, because you can have a
set of tables for each layer 3 protocol Netfilter handles.

> 2) you can select "Connection tracking" (which is allegedly
>    required for NAT/masq), without selecting "IP tables support",
>    which also claims to be necessary for NAT/masq.  this
>    suggests that "Connection tracking" should have a dependency
>    of "IP tables support", no?

Nope.
Connection tracking does not depend on IP tables, neither IP tables
depends on connection tracking. But, some feature of IP tables depends
on connection tracking, such as state matching and NAT stuff. As you can
see in kernel configuration, if you don't select connection tracking,
you can't select NAT or state matching anymore.

So, I'll try to tell it shortly (the way I understood what you needed).

1. Connection tracking is the ability for the kernel to "assemble"
   packets into connections at layer 3, 4 and 5 using modules (FTP,
   H323, etc.). This does not need user interaction, and so does not
   depend on IP tables support.

2. IP tables support provides tables for IPv4. Tables are attached to
   Netfilter's hook and are the places where users act on what Netfilter
   have to do with packets. So, if you do not have IP tables support,
   you can't act on IPv4 packets, for filtering, nating and mangling.
   IP tables support does not depend on connection tracking. you can
   have tables without connection tracking. But nat table requires
   connection tracking. State matching depends on connection tracking
   too. If you have IP tables support, but no tables available, then you
   can't act on packets too unless you have your own table to attach.

So...
You can have connection tracking without IP tables support. But what is
the point ? I can't see one.
You can have IP tables support without connection tracking, but some
depending options won't be available anymore : NAT and state matching
won't be available.
You can have IP tables support without anything else depending on it.
That will provide your kernel the ability to attach tables, but you
won't have any to attach. What's the point ? Maybe developping your own
table ?

Hope I could make myself clear and have undestood well what you wanted.
It is a quite tricky subject, and I don't know if I can express all I
want into english ;)

> i'm quite willing to move this discussion to the kernel
> mailing list if it's more appropriate there, but i figured
> i'd start here first.

Maybe netfilter-devel list would be a more appropriate place to discuss
this, as I do think Netfilter's core developpers can be far more aware
of such things as many users like me can be.


--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

