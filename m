From: Eric Leblond <eric@regit.org>
Subject: Re: problem with trying the example
Date: Mon, 01 Dec 2003 09:00:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070265652.29823.3.camel@porky>
References: <00a201c3b7ad$06b73100$cb0210ac@jz105>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-EQk1mzFWa41okmmnTwph"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a201c3b7ad$06b73100$cb0210ac@jz105>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: netfilter@lists.netfilter.org


--=-EQk1mzFWa41okmmnTwph
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le lun 01/12/2003 =C3=A0 02:47, Jee J.Z. a =C3=A9crit :
> Hi all,
>=20
> I am new to netfilter and even linux. I just wish to try the example code=
 in the man page of libipq (I saved it as test.c and have compiled it to te=
st.o). But when I make it: #cc test.o -o test, the following errors showed =
up:
>=20
> [root@kite1 netfilter]# cc test.o -o test

you need to link with the libipq library :
=20
	cc test.o -o test -lipq


--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-EQk1mzFWa41okmmnTwph
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/yvU0nxA7CdMWjzIRAgOFAKCKLF+uG7bhBFU5EwEReLRaUSkfnQCdFzJ1
7iK2/ATd6PqLLQANHwSgb5o=
=DBVU
-----END PGP SIGNATURE-----

--=-EQk1mzFWa41okmmnTwph--

