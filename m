From: Christoph Gossen <gosen@conterra.de>
Subject: Re: invert problem with multiport
Date: Wed, 19 Jun 2002 10:12:39 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D103CF7.915F759F@conterra.de>
References: <3D0F56B9.5952D779@conterra.de> <200206181618.RAA27678@slate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

Antony Stone wrote:
>=20
> On Tuesday 18 June 2002 4:50 pm, Christoph Gossen wrote:
>=20
> > Hello,
> >
> > I think there's a bug in the behaviour of the multiport module - for
> > example, a line like
> >
> >         iptables -p tcp -A OUTPUT -m multiport ! --dport 25 -j DROP
> >
> > causes the same behaviour as
> >
> >         iptables -p tcp -A OUTPUT -m multiport --dport 25 -j DROP
> >
> > or
> >
> >         iptables -p tcp -A OUTPUT --dport 25 -j DROP
> >
> > and NOT (as one would expect) that one caused by
> >
> >         iptables -p tcp -A OUTPUT ! --dport 25 -j DROP
> >
> > Inverting the (set of) port(s) due to the "!" sign in the first line
> > above is just ignored
> > (no syntax error occures)!
> >
> > Any comments?
>=20
> I don't use the multiport match myself, but I'd expect it to be:
>=20
> iptables -p tcp -A OUTPUT -m multiport --dport ! 25 -j DROP

I have already tried this - it causes a syntax error "invalid
port/service `!' specified"
(everything ok with this, to me).

>=20
> In other words "a destination port which isn't 25"....
>=20
> What does that do for you ?
>=20
> I note from the man page for iptables, though, that --dport has the [ ! ]
> option, but "multiport --dport" doesn't, so maybe negating multiports is =
not
> supported at all ?

This is what I assume, too. However, the "!" should not be silently
ignored then
but rather a syntax error should arise (to avoid confusion, or even a
potential
source of error).

Herv=E9 Eychenne wrote:
...
> multiport option is "--dports", not "--dport"...
>=20
>  RV

This is not quite right, as one can abbreviate down to even "--dp" (I
guess THIS
is really a intended feature and not a bug).

I forgot to mention the iptables version I tried: It was version 1.2.2
and 1.2.6a.


Greetings,

Christoph

