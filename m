From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: could someone translate these rules inot plain english
Date: Thu, 22 Jan 2004 08:34:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074753253.30437.44.camel@raylinux.internal>
References: <33682.66.65.52.125.1074751856.squirrel@sojourn.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-RTJXpeGQH/Q26u//zssd"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33682.66.65.52.125.1074751856.squirrel@sojourn.dyndns.org>
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


--=-RTJXpeGQH/Q26u//zssd
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-01-22 at 08:10, Technical wrote:
> -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
Add (-A) to chain RH-Firewall-1-INPUT match (-m) on state (--state)
ESTABLISHED or RELATED jump (-j) to ACCEPT (basically accept this
packet).

> -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
Add (-A) to chain RH-Firewall-1-INPUT jump (-j) to REJECT and reject
with specific options (--reject-with icmp-host-prohibited)

The chains above are user defined chains.

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-RTJXpeGQH/Q26u//zssd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAD27kh1fuR/Bv+ygRAvBRAJ9J/0ByNl17WF5oA13gHxduQ5NUdACgoNUr
/USIwg0o/GbGvY4P+GzCkMo=
=IXBP
-----END PGP SIGNATURE-----

--=-RTJXpeGQH/Q26u//zssd--


