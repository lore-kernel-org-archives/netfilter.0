From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Ping and traceroute denied?
Date: Wed, 18 Feb 2004 11:30:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077096635.2333.92.camel@raylinux.internal>
References: <40332D1F.5010806@epost.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-w9dF1oAAKm7CVoxssu7h"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40332D1F.5010806@epost.de>
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


--=-w9dF1oAAKm7CVoxssu7h
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-02-18 at 11:15, Nicole Haehnel wrote:
> Hi,
>=20
> I added this rules (with fwbuilder):
>=20
> $IPTABLES -A FORWARD -p icmp  -m state --state NEW  -j ACCEPT
> $IPTABLES -A OUTPUT -p icmp  -m state --state NEW  -j ACCEPT
> $IPTABLES -A INPUT -p icmp  -m state --state NEW  -j ACCEPT
>=20
>=20
> Why was ping from an interface of my firewall-host denied?
> Traceroute too.
>=20
When the return packets come back, their state is not NEW, probably
RELATED.

> What rule shall I add?
>=20
$IPTABLES -A INPUT -p icmp  -m state --state NEW,RELATED  -j ACCEPT

> Thanks!
>=20
> Nicole
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-w9dF1oAAKm7CVoxssu7h
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAMzC7h1fuR/Bv+ygRAotrAKCrj8BgmHKOOYK4Bdy2os6/jXYAXgCaAxNF
aBqXk8qxUU7RWBfp6F1Rp7Y=
=7kPu
-----END PGP SIGNATURE-----

--=-w9dF1oAAKm7CVoxssu7h--


