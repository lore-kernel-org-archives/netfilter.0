From: Marek Habersack <grendel@caudium.net>
Subject: Re: Tux and netfilter
Date: Mon, 7 Jul 2003 02:02:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030707000234.GD9350@thanes.org>
References: <20030706211403.GA9350@thanes.org> <20030707014751.276c32c5.arnt@c2i.net>
Reply-To: grendel@caudium.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030707014751.276c32c5.arnt@c2i.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 07, 2003 at 01:47:51AM +0200, Arnt Karlsen scribbled:
[snip]
> > clogged (it's configured to accept 50k connections, keep alives are at
> > 1000 since setting
>=20
> ..1000 seconds???  Shave off a zero or two, you should be able to serve
> any valid traffic within 5 seconds.
They are not 1000 seconds - 1000 keepalive slots tux keeps active around.
After there are more than that, it starts killing connections in the LRU
order.

> > them to 0 makes tux close any connection immediately, no logging
> > etc,). Apache sits on port 81 and when accessed directly it works
> > fine, that's good enough, but I'd like to do more. And here I come to
> > the real question I want to ask to the list. Is it possible and if
> > yes, then how, to redirect the offending packets from within tux to
> > the TARPIT chain?=20
>=20
> ..does your TARPIT traffic cost _you_ anything?
A little bit, a tiny bit. Works better than a DROP, actually. And it has the
added advantage that it ties resources of the attacker somewhat.

> > net/ipv4/icmp_echo_ignore_broadcasts=3D1
>=20
> ..also possible to lie and say the box is a crashing,=20
> or hung dead wintendo.
>=20
> > fs/file-max=3D70000
> > fs/dir-notify-enable=3D0
> > net/ipv4/tcp_keepalive_time=3D30
> > net/core/rmem_max=3D262143
> > net/core/rmem_default=3D262143
> > net/core/wmem_max=3D262143
> > net/core/wmem_default=3D262143
> > net/ipv4/tcp_sack=3D0
> > net/ipv4/tcp_timestamps=3D0
> > net/ipv4/tcp_syncookies=3D1
> > net/ipv4/icmp_echo_ignore_all =3D1
> > net/ipv4/icmp_ignore_bogus_error_responses =3D 1
> > net/ipv4/tcp_syn_retries =3D 1
> > net/ipv4/tcp_synack_retries =3D 1
> > net/ipv4/tcp_keepalive_probes =3D 1
> > net/ipv4/tcp_keepalive_intvl =3D 10
> > net/ipv4/tcp_max_syn_backlog =3D 64
> > net/ipv4/tcp_low_latency =3D 1
> > net/ipv4/tcp_abort_on_overflow =3D 1
> > net/ipv4/ipfrag_time =3D 30
> > net/ipv4/tcp_fin_timeout =3D 10
> > net/ipv4/tcp_max_orphans =3D 2048
>=20
> ..why so many?  Most of these would come from "google", no?
That's not a lot... Well, the ones that come from "google" constitute
perhaps 1/3 of the total. And I still have to think about the legit clients.

regards,

marek

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/CLiaq3909GIf5uoRAlmgAJ9a0d11fV8jnxP2/N2oudZ2jBYwBQCfSYNI
oFVrCRGUbA5B+JyWHDiUrkk=
=aZjI
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--

