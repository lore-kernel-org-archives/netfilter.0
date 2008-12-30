From: Eric Leblond <eric@inl.fr>
Subject: Re: Links to projects using netfilter
Date: Tue, 30 Dec 2008 10:37:12 +0100
Message-ID: <1230629832.17267.4.camel@khasse.inl.fr>
References: <4954EEA7.7000302@tana.it> <4955116C.7010806@gmail.com>
	 <495614F1.5070903@tana.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-G6q9y7FScGkAuTB1HFOx"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <495614F1.5070903@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Alessandro Vesely <vesely@tana.it>
Cc: Nick <vbox.nick@gmail.com>, netfilter@vger.kernel.org


--=-G6q9y7FScGkAuTB1HFOx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 27 d=C3=A9cembre 2008 =C3=A0 12:43 +0100, Alessandro Vesely a =C3=
=A9crit :
> Nick wrote:
> > Alessandro Vesely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> IPQ BDB maps an IP Queue to a Berkeley DB indexed on the ipv4
> >> field. More at https://savannah.nongnu.org/projects/ipqbdb/
> >>
> > The NFQUEUE target is nice feature. I using perl ( module ) for inspect=
=20
> > and accounting network traffic, but perl script works slow. If the=20
> > bandwidth of more than 2MBit/s, the cpu loading is 50% (C2D E6550).
> > Here is a program written in C, works much faster and less weight CPU 1=
-2%.
>=20
> Besides being written in C, using BDB makes it very fast. On the 5th=20
> day I had 9140 records and the following /top/ output
> PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  SWAP   CODE DATA COMMAND
> 15   0 10376 1308 1172 S    0  0.0   0:02.05 9068   16  252 ipqbdbd
> 18   0  9500 1312 1152 S    0  0.0   0:31.78 8188   32  256 ibd-parse
>=20
> The second line above is a daemon that applies 5 pcre expressions to=20
> each mail.log line, in order to catch attackers: it consumes 15+ times=20
> more than issuing verdicts (both configured for a single queue.)

Hmmm, I'm a real fan of NFQUEUE but using ipset seems quiet a good idea
for your application. Your case is even one of the use example given by
Jozsef Kadlecsik in his speech:
	http://nfws.inl.fr/nfws_userday/Jozsef-Kadlecsik_IPset.pdf

Why did you choose a NFQUEUE based code instead of ipset ?

BR,
--=20
=C3=89ric Leblond <eric@inl.fr>
INL, http://www.inl.fr/
NuFW, http://www.nufw.org

--=-G6q9y7FScGkAuTB1HFOx
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAklZ68UACgkQnxA7CdMWjzJZiACdHkMWaEnaxlUK79dyrP2E8FAh
A7IAnR+CGcnh8rYIuSt9P60ZPMTrEsJz
=wd70
-----END PGP SIGNATURE-----

--=-G6q9y7FScGkAuTB1HFOx--

