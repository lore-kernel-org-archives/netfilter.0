From: Alexander Samad <alex@samad.com.au>
Subject: Re: how to stop broadcasts using iptables
Date: Wed, 28 Apr 2004 10:11:37 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040428001137.GB10829@samad.com.au>
References: <20040427123529.HVYI23570.viefep19-int.chello.at@localhost> <200404271350.11890.lists@edeca.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200404271350.11890.lists@edeca.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2004 at 01:50:11PM +0100, David Cannings wrote:
> On Tuesday 27 April 2004 13:35, sschlesi@chello.at wrote:
> > I'm trying to stop broadcasts getting forwarded, but I'm  not sure how
> > to do this. i read that *.255 - which are afaik broadcast addresses -
>=20
> My first question is why are broadcasts getting forwarded anyway?  Neithe=
r=20
> ethernet or IP broadcasts should leave your subnet.  How and where=20
> exactly are broadcasts being forwarded?

maybe he is bridging ?

>=20
> IP addresses ending in .255 are not always broadcast addresses.  Any=20
> subnet larger than class C (/24) can span more than one "block" of 256 IP=
=20
> addresses.
>=20
> > doesnt guarantie that its a broadcast. then i read that its possible by
> > matching the mac address, because broadcast will have ff:ff:ff:ff:ff:ff
> > . but I'm not sure if that's all  nonsense.
>=20
> There is the difference here between an IP broadcast and an ethernet=20
> broadcast.  IP broadcasts are sent to the ethernet broadcast address [1],=
=20
> so you may be able to do a MAC match.
>=20
> According to the manual page I have here, the module "mac" only offers a=
=20
> --mac-source option but there are more options in PoM I believe, you may=
=20
> want to check the mailing list archives.
>=20
> David
>=20
> 1- A ping to the broadcast address on a LAN:
> 13:44:59.765871 0:10:XX:XX:XX:XX Broadcast ip 98: 192.168.0.100 >=20
> 192.168.0.255: icmp: echo request (DF)
>=20
>=20

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAjva5kZz88chpJ2MRAqQGAJ4tuq/gFWKC/F8bLOY7Dg/Em8SNcgCcDDGg
wmB7UHswCdFQFnVrlZdl0iA=
=XKns
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--

