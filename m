From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: 2 NICs on same subnet
Date: Fri, 5 Nov 2004 20:16:21 +0100
Message-ID: <20041105191621.GA17889@zion.homelinux.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E38F@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E38F@alderaan.smgtec.com>
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
To: netfilter@lists.netfilter.org
Cc: a.ledvinka@promon.cz


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Daniel,

On Fri, Nov 05, 2004 at 10:45:45AM -0800, Daniel Chemko told us:
> Ok, here's my two cents. There IS a solution, I can feel it. I'm just
> going to work through it through talking, and hope for the best. (Note,
> Although not totally in topic, the solution is in fact)
>=20
> 1. You're getting inbound responses on the wrong NIC because you're
> sending IP requests from the wrong device. The Switch thinks that NIC 1
> does have IP #2 (AKA: Accidental ARP poison).=20
> 2. I'm assuming you're using this for either an extra security mechanism
> or for a backup line
> 3. I'm assuming that the machine is standalone and is not hosting
> services behind it. Lets just throw that complexity out the window.
>=20
> So, the real thing you need to do is FORCE packets to/from IP1 in/out of
> IF1 and packets to/from IP2 in/out of IF2.
>=20

thanks for your and everybody's else's tipps and discussion on this topic,
I already wanted to try the iproute2 based solution today but didn't have
enough time to do this. I'll try tomorrow and come back here and tell you
about my success (or not :-).
But I also think about going to my boss and tell him that this whole idea
is crap as we won't be able to handle more input no matter if it comes in
=66rom one interface or two...I think the best solution would be to let the
second NIC stay down until the moment the first one won't work any more.


Once again, thanks to everybody!!!

Sven

--=20
Linux zion 2.6.9-rc1-mm4 #1 Tue Sep 7 12:57:19 CEST 2004 i686 athlon i386 G=
NU/Linux
 20:09:17 up 1 day, 23:37,  1 user,  load average: 0.03, 0.05, 0.01

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFBi9GFo4FAdB2PneQRAvdhAJ9h4YOn/ZQiGxTbp91uhwxe8jBvPACaAhgr
vlRGa1VRyw7j0vyV+NrUwoQ=
=8jpD
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--

