From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: ip_queue_maxlen ??
Date: Mon, 10 Jan 2005 17:38:40 +0100
Message-ID: <20050110163840.GA20345@zion.homelinux.com>
References: <a05ad87505011008132e1e372e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <a05ad87505011008132e1e372e@mail.gmail.com>
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
To: Murugavel Thiruvengadam <tmurugavel@gmail.com>
Cc: netfilter@lists.netfilter.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Murugavel,

On Mon, Jan 10, 2005 at 09:43:16PM +0530, Murugavel Thiruvengadam told us:
> Hi
>=20
> We are working on Snort-inline.   We are marking packet from kernel
> space to user  space to process the packets.
>=20
> Is there any command to see how many ip_queue are used?

take a look at /proc/net/ip_queue. This should list the desired
information.

>=20
>=20
> If I incresae the ip_queue size. will it increase the performance ?

I don't think so. It will just make the queue length bigger, so if
you're too slow it will just take longer until the queue is full and
packets get dropped. But it might help to avoid packet drop when you
have a few seconds of packet bursts.


HTH

Sven

>=20
>=20
> Any Suggestion Welcome.
>=20
> Regards
> Murugavel

--=20
Linux zion 2.6.10-bk7 #0 Fri Jan 7 19:08:39 CET 2005 i686 athlon i386 GNU/L=
inux
 17:23:24 up 2 days, 22:00,  2 users,  load average: 0.02, 0.06, 0.04

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFB4q+Qo4FAdB2PneQRAg5FAJ99/2pxaij6SJ4KxTmRYBds5s1QxgCdHec3
dvNMvkNpwqTgFD4fYrGMcoY=
=vR9/
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

