From: Eric Leblond <eric@inl.fr>
Subject: Re: matching the first packet of a connection
Date: Wed, 04 May 2005 23:30:05 +0200
Message-ID: <1115242205.5410.21.camel@porky>
References: <1115220105.26791.25.camel@localhost.localdomain>
	<4279248D.9090903@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-rDm1snqatKIa21bvqYEF"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4279248D.9090903@riverviewtech.net>
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


--=-rDm1snqatKIa21bvqYEF
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

Problem seems difficult to explain (and I'm not speaking well tonight),
here's the detail :

In the scope of the NuFW project we need to queue SYN packets for
connection we want to authenticate (see http://www.nufw.org/ for details
on principles). For a single connection we want to QUEUE only the first
packet coming to the firewall (SYN packet in the case of TCP). All
subsequent packets of the connection even if they are also SYN packet
(if for example server is unreachable or does not exist) have to me
authorized or drop depending of the decision taken on the first packet.
In fact this is an extension of the ESTABLISHED or RELATED match.

I hope my problem is clearly explained this time.

BR and thanks for the help


On Wed, 2005-05-04 at 14:37 -0500, Taylor, Grant wrote:
> > I'm trying to match the first packet of a connection : for a TCP
> > connection I want to match the first SYN packet received by the firewal=
l
> > and ignore the possible reemission, in fact I want to accept them.
> >=20
> > Is this possible ?
> >=20
> > I've try to use the conntrack module but I was not successful.
>=20
> Question:  Are you wanting to just silently DROP the first connection att=
empt and force people to try to reconnect via retransmission of the SYN pac=
ket?  If that is the case you will want to do something out side of the con=
nection tracking match extensions that exist because (as far as I know and =
understand) they all deal within a given connection.  You are really wantin=
g to break / prevent one connection attempt and then allow the subsequent o=
nes.  Or at least that's how I understand what you have written.  I have a =
feeling that you will be playing with the recent or set match extensions wh=
ere you add a connection attempt to a recent list or set list while droppin=
g the first connection attempt packet.  Subsequent connection attempt packe=
ts can then be matched against the recent list or set list to see if there =
has been a connection attempt dropped and if so accept the present connecti=
on attempt.
>=20
> If you give me more to work with I might be able to come up with a rule s=
et to help you out.
>=20
>=20
>=20
> Grant. . . .
>=20
--=20
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org
--=20
Eric Leblond <eric@inl.fr>
INL

--=-rDm1snqatKIa21bvqYEF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCeT7dnxA7CdMWjzIRAsJfAJ93i6WrRyjH+HGOBPkoG4SA8Tz7+ACfaWP8
m7T0eCdS1Lb0JRXI+WcSktM=
=yUdu
-----END PGP SIGNATURE-----

--=-rDm1snqatKIa21bvqYEF--


