From: Eric Leblond <eric@regit.org>
Subject: Re: =?ISO-8859-1?Q?CAN=B4T?= DO PING TO MY ROUTER WITH MY NETWORK
	CLIENTS
Date: Thu, 04 Sep 2003 07:52:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062654739.28246.1.camel@porky>
References: <006201c370a8$b91ae4f0$0221a0c0@DANIEL>
	 <3F56B111.4040603@kdtc.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-VfUswH19p9pNAKEzvus8"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F56B111.4040603@kdtc.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter <netfilter@lists.netfilter.org>


--=-VfUswH19p9pNAKEzvus8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Have you check that icmp_echo_ignore_all is not set in /proc/sys/net/ ?

Le jeu 04/09/2003 =C3=A0 05:27, cc a =C3=A9crit :
> Daniel Arjona wrote:
>=20
> One word of possible advice.  The amount of
> assistance/help you get is indirectly proportional
> to the amount of caps in the subject matter.
> (Of course, this only applies to the typical,
> desperate posts, and not to the actual verbiage
> that depends on caps, ie. DNAT, SNAT, POSTROUTING..
> etc.)
>=20
> Also, don't include your original message to
> your current message.  It confuses the reader
> as to what your real problem is.
>=20
> > I tried to do ping to my router and also i do the same to the ip addres=
s of
> > my dns servers and the both fails.  But the server (with iptables, mail=
,
> > squis, and others) doit everytihng.
>=20
> Perhaps if you could actually show us what your network
> layout is like, someone here might be able to help.  As it
> stands, I'm a little confused as to which IP is which.
> Basic information I suppose would help would be your
> router's Internal IP, your dns server ip and whatever
> IP you believe is pertinant to this issue.
>=20
> Furthermore, have you set up your workstations to use
> the server as the gateway(assuming of course, that _is_
> your original intention).
>=20
>=20
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-VfUswH19p9pNAKEzvus8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/VtMTnxA7CdMWjzIRAooiAJ0TpICXJoYRC4inngVAKjoL8C6OUwCeKpsj
PYgwC+uP5qWnOEEvg8MujPo=
=K+xr
-----END PGP SIGNATURE-----

--=-VfUswH19p9pNAKEzvus8--

