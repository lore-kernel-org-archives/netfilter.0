From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: ipq_read return values when timeout is specified
Date: Tue, 1 Jun 2004 09:00:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040601070048.GA896@zion.homelinux.com>
References: <OF79639C38.78EA339D-ON65256EA6.0023ED00@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OF79639C38.78EA339D-ON65256EA6.0023ED00@hss.hns.com>
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


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Amit,

On Tue, Jun 01, 2004 at 12:06:25PM +0530, aksingh@hss.hns.com told us:
>=20
> Hi,
>=20
>    Correct me if I am wrong, if I give -1 as the timeout parameter to
> ipq_read, then ipq_read returns :
>=20
> -1 incase of an error,
> a +ve non zero value, if there was something to read
> 0 if there was nothing to read, or a non-blocked signal was caught .

Right.

>=20
> Also, since I gave this -ve value as timeout parameter ipq_read would
> return immediately if there was nothing to read .

Also right.

>=20
> regards
> Amit
>=20

Sven

--=20
Linux zion 2.6.7-rc2 #2 Mon May 31 22:58:01 CEST 2004 i686 athlon i386 GNU/=
Linux
 08:59:34  up  9:59,  3 users,  load average: 0.00, 0.01, 0.00

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAvCmgo4FAdB2PneQRAncZAJ9WkPpFuIS4FB7L9k550wuxsIRXtgCfVM86
Vsxld2TA379P+6nqHsNMkE0=
=fZrm
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

