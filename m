From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: ipt_tos.ko vs ipt_TOS.ko
Date: Thu, 29 Apr 2004 17:16:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040429151628.GA7143@zion.homelinux.com>
References: <D3DD55FDB74AD511BA5100500416368053E88C@ORION>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D3DD55FDB74AD511BA5100500416368053E88C@ORION>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jochen Vogel <jvogel@it-sec.de>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Jochen,

On Thu, Apr 29, 2004 at 04:55:59PM +0200, Jochen Vogel told us:
> Hi,
>=20
> Whats the differents between ipt_tos.ko and ipt_TOS.ko?

ipt_tos is the kernel module for the tos match with which you
can match packets with a given TOS while ipt_TOS is the module
providing the TOS target used to set the TOS value.

HTH

Sven

>=20
> Thx for infos
> jo

--=20
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GNU/=
Linux
 17:14:40  up 8 days, 22:04,  1 user,  load average: 0.00, 0.00, 0.00

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAkRxMo4FAdB2PneQRAmc4AJ4s/r85wC6OI5jYs/jz/c338jKx/QCaAvFE
FPsEme/CoMAbHfxZqpgXR/0=
=BFMS
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

