From: Eric Leblond <eric@inl.fr>
Subject: Re: running commands when packet matched
Date: Sun, 04 Dec 2005 01:11:13 +0100
Message-ID: <1133655073.17460.4.camel@porky>
References: <43921EA4.7060905@cise.ufl.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-MfxQNV08cpoH7ei93n0w"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43921EA4.7060905@cise.ufl.edu>
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
To: James Rhett Aultman <jaultman@cise.ufl.edu>
Cc: netfilter@lists.netfilter.org


--=-MfxQNV08cpoH7ei93n0w
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2005-12-03 at 17:39 -0500, James Rhett Aultman wrote:
> Dear Netfilter users,
>=20
>  Again, to explain the mechanism I need: when the
> machine encounters a packet matching a rule, I want the machine to run a
> specific program and drop the packet.
>=20
> Is something like this possible using iptables or another netfilter proje=
ct?

Yes, just use the QUEUE or NFQUEUE target. This send packet to userspace
and there you can do what you want. In your case, match and accept the
packets and then a match is done, do your job ....

If you need some code example, you can have a look at NuFW :
	http://www.nufw.org/

By the way, you could also have a look at ulogd2 which brings some
features that may interest you :
	http://svn.gnumonks.org/branches/ulog/ulogd2/


BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-MfxQNV08cpoH7ei93n0w
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDkjQgnxA7CdMWjzIRAox0AJ4lrK3E9byTEkEdsM1Vsm1wkdqZ6QCgg66W
INX/yIf58gSvsefVag4pUTA=
=XL11
-----END PGP SIGNATURE-----

--=-MfxQNV08cpoH7ei93n0w--


