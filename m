From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Forwarding Multicast Traffic
Date: Tue, 10 Feb 2004 13:17:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076411868.2827.0.camel@raylinux.internal>
References: <F5200854-5AD1-11D8-87C2-000A95C71776@freezone.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-eYRsHqejcyY8LPIg8Rjk"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F5200854-5AD1-11D8-87C2-000A95C71776@freezone.co.uk>
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


--=-eYRsHqejcyY8LPIg8Rjk
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-02-09 at 09:31, ms419@freezone.co.uk wrote:
> Two machines communicate with one another using multicast - mDNS - when=20
> they are on the same network segment. When they are on separate network=20
> segments, however - though they can connect to one another across a=20
> router - they can't communicate using multicast. I presume that this is=20
> because the router isn't forwarding multicast traffic to other network=20
> segments? The router is running Linux kernel version 2.4.23 and=20
> iptables. How can I configure iptables to forward multicast traffic to=20
> other network segments?
>=20
Make sure you have the appropriate FORWARD and -t nat PREROUTING (if you
use NAT) rules to forward the multicast traffic (224.0.0.0)

> Thanks very much,
>=20
> Jack
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-eYRsHqejcyY8LPIg8Rjk
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAKL3ch1fuR/Bv+ygRAm78AKC1eju3V6l4Pvl5qnCjd+JgbJ2JiQCgsSMs
VuaYIkeNg3xcEVzjr80hGvI=
=W4G8
-----END PGP SIGNATURE-----

--=-eYRsHqejcyY8LPIg8Rjk--


