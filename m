From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Reinjecting packets using libipq
Date: Tue, 20 Apr 2004 10:41:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040420084123.GA25017@zion.homelinux.com>
References: <OF572AD826.46D213EB-ON65256E7C.002B3539@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OF572AD826.46D213EB-ON65256E7C.002B3539@hss.hns.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: aksingh@hss.hns.com
Cc: netfilter@lists.netfilter.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Amit,

On Tue, Apr 20, 2004 at 01:26:34PM +0530, aksingh@hss.hns.com told us:
>=20
>=20
>=20
>=20
> hi
>=20
>  when I use ip_set_verdict to reinject a packet into the kernel from user
> space(suppose the verdict is NF_ACCEPT), what happens ...
> 1) does the packet get reinjected at the PRE_ROUTING phase ?
> 2) If so can I be sure that the packet doesnt get caught at the same hook
> which first queued it to the user space ?

The packet gets reinjected where it was taken to user space. E.g. when
you have a chain with 5 rules and the packet is taken to user space
at rule #3 it will continue traversal in the very same chain at rule #4.

>=20
> thanks
> Amit
>=20


HTH

Sven

--=20
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GNU/=
Linux
 10:38:14  up 2 days, 17:35,  1 user,  load average: 0.08, 0.05, 0.01

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAhOIzo4FAdB2PneQRAn5ZAJ9NnDhuLgo3guXmOFq2l+//EFxupwCfah6a
18lI0ZGI3UtXjc3dupY1g08=
=pp/R
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

