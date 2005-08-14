From: Eric Leblond <eric@inl.fr>
Subject: Re: IP Tables slows network response times
Date: Sun, 14 Aug 2005 11:49:27 +0200
Message-ID: <1124012967.4878.2.camel@porky>
References: <200508142133.57867.michael@networkstuff.co.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-VNKpihkVXaMhNiIRYe79"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508142133.57867.michael@networkstuff.co.nz>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: michael@networkstuff.co.nz
Cc: netfilter@lists.netfilter.org


--=-VNKpihkVXaMhNiIRYe79
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2005-08-14 at 21:33 +1200, Michael Hallager wrote:
> Hello all.
>=20
> I have spent rather a lot of time trying to find an answer for this one.
>=20
> I have a Slackware Linux box, 2.4.29 kernel running IP Tables. I have the=
 bare=20
> number of needed modules compiled into the custom kernel.

> This works except it makes webpages and email served from this box SLOW t=
o=20
> respond. (Several seconds).
>=20

several seconds ? looks like you've got a timeout problem on name
resolution (or another network access). Please ensure that DNS or name
resolution traffic is not blocked.
More over, add a rule to accept loopback traffic on INPUT, blocked
loopback traffic could explain problem you have.

Hope this help,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-VNKpihkVXaMhNiIRYe79
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBC/xOnnxA7CdMWjzIRAtnyAJ9fm+ZgcHda3iEFm3AKkqNSAA4DrwCfVhm+
HwvfHhL2U6Tr514cpDQbtOk=
=DlxE
-----END PGP SIGNATURE-----

--=-VNKpihkVXaMhNiIRYe79--


