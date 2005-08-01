From: Eric Leblond <eric@inl.fr>
Subject: Re: about NFQUEUE and nth match
Date: Mon, 01 Aug 2005 22:42:41 +0200
Message-ID: <1122928961.5084.12.camel@porky>
References: <WorldClient-F200508011629.AA29430066@tesla.cujae.edu.cu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-WWWSm5Oi43xWXcYm/2fn"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <WorldClient-F200508011629.AA29430066@tesla.cujae.edu.cu>
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
To: Frank Abel Cancio Bello <FRANKABEL@tesla.cujae.edu.cu>
Cc: netfilter@lists.netfilter.org


--=-WWWSm5Oi43xWXcYm/2fn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2005-08-01 at 16:29 -0400, Frank Abel Cancio Bello wrote:
> Hi all!
>=20
> Some time ago I post a mail in this list=20
> ("https://lists.netfilter.org/pipermail/netfilter/2005-April/059499.html"=
)=20
> asking about how manage packets  that was captured with "libipq" and "QUE=
UE"=20
> target in different threads or process.
>=20
> Now with the new "NFQUEUE" target I can have many process reading parcket=
s=20
> in different queues numbers and using "nth match" to spread equitably ove=
r=20
> all process the captured packects.=20

This look terribly awfull to me ! You better use a single multithreaded
application.

> My questions are:
>=20
> 1-What libipq's functions change and how? I look in the manpage in the=20
> recent 1.3.3 iptables release and don't find anything.

It will come soon, userspace lib is only available from svn. A compat
libipq library is planned but there's still work to do on it.
SVN is available at :=20
	http://svn.netfilter.org/netfilter/trunk/
Currently the userspace API is work in progress...

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-WWWSm5Oi43xWXcYm/2fn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBC7olBnxA7CdMWjzIRAjXgAJ9dtg5oiITQftn+4cJ+BNEuQJaUCQCgg1lw
pZDfytbS4Kd4c172FtgsKJ4=
=QVbl
-----END PGP SIGNATURE-----

--=-WWWSm5Oi43xWXcYm/2fn--


