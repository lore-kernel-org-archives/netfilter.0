From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Routing problem...
Date: Tue, 27 Jul 2004 09:42:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040727074251.GA23024@zion.homelinux.com>
References: <20040727072329.GV20473@freenet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040727072329.GV20473@freenet.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Michelle Konzack <linux4michelle@freenet.de>
Cc: netfilter@lists.netfilter.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Michelle,

On Tue, Jul 27, 2004 at 09:23:29AM +0200, Michelle Konzack told us:
>=20
>  \______________________________________________________________________
>=20
> But if I execute the script, I get:=20
>=20
> iptables: No chain/target/match by that name
>=20

at which iptables invocation do you get this error exactly?? Try
executing the script with "sh -x scriptname" and look where the
error occurs.
What kernel version are you using, what version of iptables?


Sven

> Whats wrong ?
> I have compiled Linux with ALL netfilter modules in.
>=20
> Greetings
> Michelle



--=20
Linux zion 2.6.8-rc2 #1 Sun Jul 18 15:00:48 CEST 2004 i686 athlon i386 GNU/=
Linux
 09:40:33  up 8 days, 11:08,  1 user,  load average: 2.14, 2.07, 2.01

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFBBgd7o4FAdB2PneQRArHkAJwNMpCs3A4NrIex879W26ubItD0EgCeOTK8
KCvl2Xo0n95jUpZi4ZJz5/I=
=dr+O
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--

