From: Eric Leblond <eric@inl.fr>
Subject: Re: ULOG vs. NFQUEUE
Date: Sat, 01 Dec 2007 23:33:14 +0100
Message-ID: <1196548394.16574.42.camel@localhost>
References: <d95317090711301506h43e67d07x55d7a8535f284606@mail.gmail.com>
	 <1196507676.16574.26.camel@localhost>
	 <d95317090712011033k6e02776eiabff90210c7fb97d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-SHV7tizbxKxxeFDIxJ1C"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090712011033k6e02776eiabff90210c7fb97d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>


--=-SHV7tizbxKxxeFDIxJ1C
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 01 d=E9cembre 2007 =E0 10:33 -0800, Gilad Benjamini a =E9crit :
> Thanks.
> If I wouldn't be missing the whole thing, I wouldn't have asked this ques=
tion.
> Your example implies that the packets need to be "injected" back into
> the packet flow.
> How is this done ?

This is done by calling nfq_set_verdict or nfq_set_verdict_mark in
userspace.

kernel gives a id to the packet before sending it to userspace via
[nf]netlink. It then waits for a [nf]netlink message from userspace
which will tell them what to do with the packet identified by its id.

As you may guess, the packet id is an argument of the verdict function.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-SHV7tizbxKxxeFDIxJ1C
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHUeEqnxA7CdMWjzIRAqkBAJoCXPvvstwgUlr0egLC94s4RI1ZSACeNHQ5
7yvrc+ygQJs5Rwt5tdjJL1E=
=Gn8u
-----END PGP SIGNATURE-----

--=-SHV7tizbxKxxeFDIxJ1C--

