From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: STATELESS
Date: 16 Sep 2003 14:46:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063716386.31093.160.camel@raylinux.internal>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew>
	 <200309161256.15286.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-m7hIiLgoOcgI1+ttj5UC"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309161256.15286.gdh@acentral.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-m7hIiLgoOcgI1+ttj5UC
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-09-16 at 13:56, Gavin Hamill wrote:
> On Tuesday 16 September 2003 12:36, Matthew Mileham wrote:
>=20
> > Does any know how to change Iptables from statefull to stateless ?
>=20
> Don't load the ip_conntrack module, and / or don't use any iptables rules=
 that=20
> use "-m state"  in the arguments :)
Yeah, connection tracking automagically implies state inspection.

>=20
> Cheers,
> Gavin.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-m7hIiLgoOcgI1+ttj5UC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/ZwYih1fuR/Bv+ygRAhu3AJ9Kfc41ya6+EjxF8B1JYQFwvgspLgCeJq6M
g0Sr6jFkR8ItTepd/L6NxHA=
=piRB
-----END PGP SIGNATURE-----

--=-m7hIiLgoOcgI1+ttj5UC--


