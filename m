From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: netfilter for IPv4 and IPv6
Date: Fri, 16 Apr 2004 12:40:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082112044.23863.56.camel@raylinux.internal>
References: <407FB35E.4000605@di.uminho.pt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ldYQ9x22qfux70HCvE2k"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <407FB35E.4000605@di.uminho.pt>
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


--=-ldYQ9x22qfux70HCvE2k
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-04-16 at 12:20, Jose Luis Faria wrote:
> Hello,
>=20
> I have some servers and others machines already in IPv6, some of them=20
> are firewalls.
>=20
> The firewalls are dual stack:IPv6 and IPv4. I must use iptables for IPv4
> and ip6tables for IPv6, it means, the same firewall must filter packects=20
> from
> IPv4 machines and IPv6 machines.
> I'm looking for any help in the net but I can not find any help about thi=
s.
>=20
> What can I do to solve this problem?
> Any ideas?
>=20
iptables (with a correctly compiled kernel) supports both ipv4 and ipv6.

> thanks in advance.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-ldYQ9x22qfux70HCvE2k
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAf7gsh1fuR/Bv+ygRAscqAJ0cXRflPVyZ8ktQFfs6dP7FaaBCKgCeOO3V
Jt0UxYwrtURbRPv49FM53+M=
=scAK
-----END PGP SIGNATURE-----

--=-ldYQ9x22qfux70HCvE2k--


