From: Eric Leblond <eric@inl.fr>
Subject: Re: A secure router, by MAC address
Date: Wed, 20 Oct 2004 22:23:42 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098303822.8628.54.camel@porky>
References: <1098297965.5686.9.camel@6-allhosts>
	<1098299562.8628.48.camel@porky> <1098300513.5684.15.camel@6-allhosts>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-uIYhuiQrXj79p8Ysa7QR"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1098300513.5684.15.camel@6-allhosts>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: "jgalvez@webpipe.net" <jgalvez@webpipe.net>
Cc: netfilter@lists.netfilter.org


--=-uIYhuiQrXj79p8Ysa7QR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-10-20 at 13:28 -0600, jgalvez@webpipe.net wrote:
> Eric,
>=20
> I looked into NuFW, but it seems more complex that what I need.  The
> biggest drawback to it is the requirement for each client to be running
> authentication software.

Well, it seems the new no client mode was really awaited ;-)

NuFW 0.9.5 was released today bringing the possibility to do
authentication without client. The main problem is that for the moment,
only an ident module is provided ... If you only use Linux on your PC,
it can be a solution. If it is not the case, then it will only be a
solution when the work on "microsoft" module will be finished.

BR,

>=20
> All I really need are a few specific rules, if traffic is coming in on
> this interface from this IP and mac, allow it, otherwise redirect ts
> localhost if destination port is 80.
>=20
> -Josh
>=20
> On Wed, 2004-10-20 at 13:12, Eric Leblond wrote:
> > Hi,
> >=20
> > It really looks like you want to distinguish between well know users an=
d
> > a set of mobile users.
> > NuFW (http://www.nufw.org) is done to distinguish between users because
> > it's an authentication firewall. It authenticates connection in a secur=
e
> > manner, so you're sure of the identity of users that you let go accross
> > your firewall.
> >=20
> > You can easily manage to build a solution comparable to the one you
> > describe below with NuFW. With more flexibility and more security.
>=20
> > BR,
>=20
--=20
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org

--=-uIYhuiQrXj79p8Ysa7QR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBdslOnxA7CdMWjzIRArMoAJ9FhapGzHAnnrgHdXEo/XJBTaYSnQCfeCx8
DC0imMJ+52VwxfKdZXJh7vY=
=00pL
-----END PGP SIGNATURE-----

--=-uIYhuiQrXj79p8Ysa7QR--


