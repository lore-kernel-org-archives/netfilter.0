From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Two IP add
Date: 05 Jun 2003 13:07:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054811262.13885.34.camel@raylinux.internal>
References: <200306051156.45624.pandre@darkstar.nom.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-TDgH4imiWH5nDFdKloc0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200306051156.45624.pandre@darkstar.nom.za>
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


--=-TDgH4imiWH5nDFdKloc0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-06-05 at 11:56, Paulo Andre wrote:
> I would like to do the following:
>=20
> Stop MASQUESRADING to two servers say. 10.10.10.5 and 10.10.10.8, how wou=
ld i=20
> do this with a rule.
>=20
> iptables -t nat -A POSTROUTING -s x.x.x.x -d ! 'servers ip' -j MASQUERADE=
=20
> now how would i put in two ip address's ?
>=20
how about using 3 rules?
iptables -t nat -A POSTROUTING -d server1.ip.address -j return
iptables -t nat -A POSTROUTING -d server2.ip.address -j return
iptables -t nat -A POSTROUTING -s x.x.x.x -j MASQUERADE

Ray

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-TDgH4imiWH5nDFdKloc0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+3yR+h1fuR/Bv+ygRAj+1AJ9jKtKqEATWrYkgnrr8+z7y+1ktsACfVWST
L3wFYK9uMaNrAld2YNBl4mg=
=DQir
-----END PGP SIGNATURE-----

--=-TDgH4imiWH5nDFdKloc0--


