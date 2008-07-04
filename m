From: Eric Leblond <eric@inl.fr>
Subject: Re: NFQUEUE hello world-style program
Date: Fri, 4 Jul 2008 16:08:08 +0200
Message-ID: <20080704140808.GC30729@bayen.regit.org>
References: <200807031607.21168.simon.perreault@viagenie.ca> <20080704092637.GA30729@bayen.regit.org> <200807040828.37923.simon.perreault@viagenie.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200807040828.37923.simon.perreault@viagenie.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Simon Perreault <simon.perreault@viagenie.ca>
Cc: netfilter@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Friday, 2008 July  4 at  8:28:37 -0400, Simon Perreault wrote:
> On Friday 04 July 2008 05:26:38 Eric Leblond wrote:
> > You are missing the unbind  bind
> >
> > 	nfq_unbind_pf(h, AF_INET);
> > 	nfq_bind_pf(h, AF_INET);
> >
> > You can have a look at for working  code:
> >  * utils/nfqnl_test.c in libnetfilter_queue sources
> >  *
> > http://software.inl.fr/trac/browser/mirror/edenwall/nufw/trunk/nufw/src=
/nuf
> >w/packetsrv.c#L219
>=20
> Many thanks!
>=20
> I suppose if I want to bind to multiple families I do as in packetsrv.c,=
=20
> right?
>=20
> nfq_unbind_pf(h, AF_INET);
> nfq_bind_pf(h, AF_INET);
> nfq_unbind_pf(h, AF_INET6);
> nfq_bind_pf(h, AF_INET6);


Exact !

> And out of curiosity, is the unbind really needed or is it a relic of the=
=20
> past? :)

Don't know could you test this ? I did not change or look at my code on
NuFW since a long time now.

>=20
> Thanks again,

You're welcome.

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIbi7InxA7CdMWjzIRAlWzAJ4k54xYFLNI7k792FF+nx3wUwgJpACfS/ms
s4PqeUQ6Ptht4TGa9xgzcXM=
=jYfG
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
