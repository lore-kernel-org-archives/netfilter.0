From: Eric Leblond <eric@regit.org>
Subject: Re: Broadcast
Date: Mon, 01 Mar 2004 14:37:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078148276.20266.21.camel@tech004.alphalink.fr>
References: <200403011009.55740.igor@garant.koenig.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-/pRgJ0jfr4ZiegBBfI+R"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403011009.55740.igor@garant.koenig.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: =?koi8-r?Q?=E9=C7=CF=D2=D8_=F0=CF=D0=CF=D7?= <igor@garant.koenig.ru>
Cc: Netfilter-List <netfilter@lists.netfilter.org>


--=-/pRgJ0jfr4ZiegBBfI+R
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le lun 01/03/2004 =C3=A0 09:09, =D0=98=D0=B3=D0=BE=D1=80=D1=8C =D0=9F=D0=BE=
=D0=BF=D0=BE=D0=B2 a =C3=A9crit :
> 	I have a question, if my iface receive a broadcast packet in what chain =
it=20
> will go in INPUT or FORWARD?

As a broadcast packet is a packet internal to a network, it don't have
to go through a router, so it will go on INPUT chain.

BR,
--=20
Eric Leblond
NuFW, Now User Filtering Works (http://www.nufw.org)

--=-/pRgJ0jfr4ZiegBBfI+R
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAQzyznxA7CdMWjzIRAglCAJ4ho9KKX4/153fkNMwBVhlfyN7EOwCcC3Sg
yo5HICQ/90sQ2K7h/w/Go20=
=Ss+3
-----END PGP SIGNATURE-----

--=-/pRgJ0jfr4ZiegBBfI+R--


